#!/usr/bin/env python3

"""
Example Python script for MySQL binlog processing.

Usage:
    python3 mysql_binlog_processor.py <binlog_file>
"""

import sys
import re
import argparse
import mysql.connector
from dataclasses import dataclass

# Hard-coded MySQL connection details
MYSQL_HOST = "localhost"
MYSQL_PORT = 3306
MYSQL_USER = "root"
MYSQL_PASS = "secret"
MYSQL_DB   = "test"

@dataclass
class QueryItem:
    table_name: str
    sql: str

def usage():
    """Print the usage string."""
    print("Usage: python3 mysql_binlog_processor.py [-v] <binlog_file>")

def get_column_map(connection, table_name):
    """
    Given a MySQL connection and a table name, return a dictionary
    mapping integers starting at 1 to the column names, in the order
    returned from the database.
    """
    column_map = {}
    cursor = connection.cursor()
    cursor.execute(f"DESCRIBE `{table_name}`")
    columns = cursor.fetchall()
    for i, col in enumerate(columns, start=1):
        column_map[i] = col[0]
    cursor.close()
    return column_map

def parse_arguments():
    """
    Parse command-line arguments and return the parsed object.
    """
    parser = argparse.ArgumentParser(description="Process a MySQL binlog file.")
    parser.add_argument("-v", "--verbose", action="store_true",
                        help="Enable verbose output.")
    parser.add_argument("binlog_file", 
                        help="Path to the binlog file to process.")
    return parser.parse_args()

def connect_to_mysql():
    """
    Establish a connection to the MySQL database using the global settings.
    """
    return mysql.connector.connect(
        host=MYSQL_HOST,
        port=MYSQL_PORT,
        user=MYSQL_USER,
        password=MYSQL_PASS,
        database=MYSQL_DB
    )

def parse_binlog_file(binlog_file, verbose=False):
    """
    Read the binlog file, find query blocks for INSERT, UPDATE, DELETE,
    and return a list of QueryItem objects.
    """
    # Regex now matches:
    #   - 'INSERT INTO'
    #   - 'UPDATE'
    #   - 'DELETE FROM'
    # Capturing group (1) is the table name.
    pattern_new_query = re.compile(
        r'^###\s+(?:INSERT\s+INTO|UPDATE|DELETE\s+FROM)\s+`[^`]+`\.`([^`]+)`',
        re.IGNORECASE
    )

    queries = []
    current_lines = []
    current_table = None
    in_query_block = False

    with open(binlog_file, 'r') as f:
        for line in f:
            line_stripped = line.rstrip('\n')

            if line_stripped.startswith("###"):
                # Check if it's a new recognized query (INSERT, UPDATE, DELETE)
                match = pattern_new_query.match(line_stripped)
                if match:
                    # If we were already in a query block, finalize it
                    if in_query_block:
                        queries.append(QueryItem(
                            table_name=current_table,
                            sql="\n".join(current_lines)
                        ))
                    # Start a new query block
                    current_table = match.group(1)  # Table name is now group(1)
                    current_lines = [line_stripped]
                    in_query_block = True
                else:
                    # It's a line starting with ### but not a new recognized query
                    if in_query_block:
                        current_lines.append(line_stripped)
            else:
                # Line doesn't start with ###, so end the current query if we're in one
                if in_query_block:
                    queries.append(QueryItem(
                        table_name=current_table,
                        sql="\n".join(current_lines)
                    ))
                    in_query_block = False
                    current_table = None
                    current_lines = []

    # If we reached the end of file and are still in a query block, finalize it
    if in_query_block:
        queries.append(QueryItem(
            table_name=current_table,
            sql="\n".join(current_lines)
        ))

    if verbose:
        print(f"Found {len(queries)} queries in the binlog.")

    return queries

def transform_queries(queries, connection):
    """
    Replace placeholder markers (@1, @2, etc.) in each query with the corresponding
    column names, using a cache of column maps so we only query each table once.
    """
    # Pattern to handle lines that may include "###" and spaces before @1, @2, etc.
    pattern = re.compile(r'^(\s*(?:###\s*)?)(@\d+)(.*)')
    column_map_cache = {}

    for i, query in enumerate(queries):
        if query.table_name not in column_map_cache:
            column_map_cache[query.table_name] = get_column_map(connection, query.table_name)
        col_map = column_map_cache[query.table_name]

        updated_lines = []
        for line in query.sql.splitlines():
            match = pattern.match(line)
            if match:
                leading = match.group(1)      # e.g. "###   " or spaces
                placeholder = match.group(2)  # e.g. "@1"
                rest = match.group(3)         # remainder of the line
                idx = int(placeholder[1:])    # remove '@' and convert digits
                col_name = col_map.get(idx, f'UNKNOWN_COLUMN_{idx}')
                updated_lines.append(leading + col_name + rest)
            else:
                updated_lines.append(line)

        queries[i] = QueryItem(
            table_name=query.table_name,
            sql="\n".join(updated_lines)
        )

def output_queries(queries, verbose=False):
    """
    Print the queries to stdout. If verbose, print them with table info,
    otherwise just print the raw SQL (with '### ' removed and trailing semicolons).
    """
    if verbose:
        for q in queries:
            print("TABLE:", q.table_name)
            print("SQL:")
            print(q.sql)
            print("-----")
    else:
        for q in queries:
            # Remove '### ' at the start of any line before printing
            cleaned_sql = re.sub(r'(?m)^### ', '', q.sql) 
            print(cleaned_sql + ";")

def main():
    args = parse_arguments()

    try:
        connection = connect_to_mysql()
        if args.verbose:
            print(f"Connected to MySQL at {MYSQL_HOST}:{MYSQL_PORT} as {MYSQL_USER}.")

        queries = parse_binlog_file(args.binlog_file, args.verbose)
        transform_queries(queries, connection)
        output_queries(queries, args.verbose)

        connection.close()
    except mysql.connector.Error as err:
        print(f"Error connecting to MySQL: {err}")
        sys.exit(1)

if __name__ == "__main__":
    main()
