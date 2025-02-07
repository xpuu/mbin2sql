# Init or reinit the db

./dm.sh < schema.sql

# Mysql interactive shell

./dmi.sh

# Make some updates

echo 'flush logs;' | ./dm.sh
./dm.sh < test.sql
echo 'flush logs;' | ./dm.sh

# Decode specific log

./dl.sh data/bb8d6b813472-bin.000002 > pseudo.sql

# Parse decoded log into queries:

parse-binlog.py pseudo.sql

# parse-binlog.py Setup

MySQL server setup:
- If needed, add user for the script on the server, e.g. CREATE USER 'root'@'some.remote.server' identified by 'secret';
- Ensure all privileges so DESCRIBE query can run: GRANT ALL PRIVILEGES ON \*.\* TO 'root'@'some.remote.server';

Python script setup:
- Put MySQL config data at the top of the file
- chmod +x
- Call with -h or no params to see command line usage
