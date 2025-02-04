# Executing: mysqlbinlog --verbose /var/lib/mysql/bb8d6b813472-bin.000004
# The proper term is pseudo_replica_mode, but we use this compatibility alias
# to make the statement usable on server versions 8.0.24 and older.
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=1*/;
/*!50003 SET @OLD_COMPLETION_TYPE=@@COMPLETION_TYPE,COMPLETION_TYPE=0*/;
DELIMITER /*!*/;
# at 4
#250204 18:07:05 server id 1  end_log_pos 126 CRC32 0x0b5d330c 	Start: binlog v 4, server v 8.0.41 created 250204 18:07:05
# Warning: this binlog is either in use or was not closed properly.
BINLOG '
OUmiZw8BAAAAegAAAH4AAAABAAQAOC4wLjQxAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAEwANAAgAAAAABAAEAAAAYgAEGggAAAAICAgCAAAACgoKKioAEjQA
CigAAQwzXQs=
'/*!*/;
# at 126
#250204 18:07:05 server id 1  end_log_pos 157 CRC32 0x49bde7c4 	Previous-GTIDs
# [empty]
# at 157
#250204 18:07:09 server id 1  end_log_pos 236 CRC32 0xf2e29005 	Anonymous_GTID	last_committed=0	sequence_number=1	rbr_only=no	original_committed_timestamp=1738688829294985	immediate_commit_timestamp=1738688829294985	transaction_length=273
# original_commit_timestamp=1738688829294985 (2025-02-04 18:07:09.294985 CET)
# immediate_commit_timestamp=1738688829294985 (2025-02-04 18:07:09.294985 CET)
/*!80001 SET @@session.original_commit_timestamp=1738688829294985*//*!*/;
/*!80014 SET @@session.original_server_version=80041*//*!*/;
/*!80014 SET @@session.immediate_server_version=80041*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 236
#250204 18:07:09 server id 1  end_log_pos 430 CRC32 0x253d37ae 	Query	thread_id=23	exec_time=0	error_code=0	Xid = 114
use `test`/*!*/;
SET TIMESTAMP=1738688829/*!*/;
SET @@session.pseudo_thread_id=23/*!*/;
SET @@session.foreign_key_checks=1, @@session.sql_auto_is_null=0, @@session.unique_checks=1, @@session.autocommit=1/*!*/;
SET @@session.sql_mode=35651584/*!*/;
SET @@session.auto_increment_increment=1, @@session.auto_increment_offset=1/*!*/;
/*!\C latin1 *//*!*/;
SET @@session.character_set_client=8,@@session.collation_connection=8,@@session.collation_server=255/*!*/;
SET @@session.lc_time_names=0/*!*/;
SET @@session.collation_database=DEFAULT/*!*/;
/*!80011 SET @@session.default_collation_for_utf8mb4=255*//*!*/;
/*!80013 SET @@session.sql_require_primary_key=0*//*!*/;
CREATE TABLE IF NOT EXISTS categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(50)
)
/*!*/;
# at 430
#250204 18:07:09 server id 1  end_log_pos 509 CRC32 0x44f83c8d 	Anonymous_GTID	last_committed=1	sequence_number=2	rbr_only=yes	original_committed_timestamp=1738688829300710	immediate_commit_timestamp=1738688829300710	transaction_length=326
/*!50718 SET TRANSACTION ISOLATION LEVEL READ COMMITTED*//*!*/;
# original_commit_timestamp=1738688829300710 (2025-02-04 18:07:09.300710 CET)
# immediate_commit_timestamp=1738688829300710 (2025-02-04 18:07:09.300710 CET)
/*!80001 SET @@session.original_commit_timestamp=1738688829300710*//*!*/;
/*!80014 SET @@session.original_server_version=80041*//*!*/;
/*!80014 SET @@session.immediate_server_version=80041*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 509
#250204 18:07:09 server id 1  end_log_pos 584 CRC32 0x6f1e6cee 	Query	thread_id=23	exec_time=0	error_code=0
SET TIMESTAMP=1738688829/*!*/;
BEGIN
/*!*/;
# at 584
#250204 18:07:09 server id 1  end_log_pos 648 CRC32 0xba6bae79 	Table_map: `test`.`categories` mapped to number 111
# has_generated_invisible_primary_key=0
# at 648
#250204 18:07:09 server id 1  end_log_pos 725 CRC32 0xbe5d0330 	Write_rows: table id 111 flags: STMT_END_F

BINLOG '
PUmiZxMBAAAAQAAAAIgCAAAAAG8AAAAAAAEABHRlc3QACmNhdGVnb3JpZXMAAgMPAsgAAgEBAAID
/P8Aea5rug==
PUmiZx4BAAAATQAAANUCAAAAAG8AAAAAAAEAAgAC/wABAAAAC0VsZWN0cm9uaWNzAAIAAAAFQm9v
a3MAAwAAAAhDbG90aGluZzADXb4=
'/*!*/;
### INSERT INTO `test`.`categories`
### SET
###   @1=1
###   @2='Electronics'
### INSERT INTO `test`.`categories`
### SET
###   @1=2
###   @2='Books'
### INSERT INTO `test`.`categories`
### SET
###   @1=3
###   @2='Clothing'
# at 725
#250204 18:07:09 server id 1  end_log_pos 756 CRC32 0xdb836538 	Xid = 115
COMMIT/*!*/;
# at 756
#250204 18:07:09 server id 1  end_log_pos 833 CRC32 0x134c3342 	Anonymous_GTID	last_committed=2	sequence_number=3	rbr_only=no	original_committed_timestamp=1738688829319089	immediate_commit_timestamp=1738688829319089	transaction_length=220
# original_commit_timestamp=1738688829319089 (2025-02-04 18:07:09.319089 CET)
# immediate_commit_timestamp=1738688829319089 (2025-02-04 18:07:09.319089 CET)
/*!80001 SET @@session.original_commit_timestamp=1738688829319089*//*!*/;
/*!80014 SET @@session.original_server_version=80041*//*!*/;
/*!80014 SET @@session.immediate_server_version=80041*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 833
#250204 18:07:09 server id 1  end_log_pos 976 CRC32 0x0b82643a 	Query	thread_id=23	exec_time=0	error_code=0	Xid = 117
SET TIMESTAMP=1738688829/*!*/;
/*!80013 SET @@session.sql_require_primary_key=0*//*!*/;
ALTER TABLE users CHANGE username user_name VARCHAR(50)
/*!*/;
# at 976
#250204 18:07:09 server id 1  end_log_pos 1053 CRC32 0x9b55e6b2 	Anonymous_GTID	last_committed=3	sequence_number=4	rbr_only=no	original_committed_timestamp=1738688829417911	immediate_commit_timestamp=1738688829417911	transaction_length=204
# original_commit_timestamp=1738688829417911 (2025-02-04 18:07:09.417911 CET)
# immediate_commit_timestamp=1738688829417911 (2025-02-04 18:07:09.417911 CET)
/*!80001 SET @@session.original_commit_timestamp=1738688829417911*//*!*/;
/*!80014 SET @@session.original_server_version=80041*//*!*/;
/*!80014 SET @@session.immediate_server_version=80041*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 1053
#250204 18:07:09 server id 1  end_log_pos 1180 CRC32 0x8e7ea9a1 	Query	thread_id=23	exec_time=0	error_code=0	Xid = 119
SET TIMESTAMP=1738688829/*!*/;
/*!80013 SET @@session.sql_require_primary_key=0*//*!*/;
ALTER TABLE products MODIFY price FLOAT
/*!*/;
# at 1180
#250204 18:07:09 server id 1  end_log_pos 1257 CRC32 0x504ef69c 	Anonymous_GTID	last_committed=4	sequence_number=5	rbr_only=no	original_committed_timestamp=1738688829454107	immediate_commit_timestamp=1738688829454107	transaction_length=241
# original_commit_timestamp=1738688829454107 (2025-02-04 18:07:09.454107 CET)
# immediate_commit_timestamp=1738688829454107 (2025-02-04 18:07:09.454107 CET)
/*!80001 SET @@session.original_commit_timestamp=1738688829454107*//*!*/;
/*!80014 SET @@session.original_server_version=80041*//*!*/;
/*!80014 SET @@session.immediate_server_version=80041*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 1257
#250204 18:07:09 server id 1  end_log_pos 1421 CRC32 0xad3ccd52 	Query	thread_id=23	exec_time=0	error_code=0	Xid = 121
SET TIMESTAMP=1738688829/*!*/;
SET @@session.time_zone='SYSTEM'/*!*/;
/*!80013 SET @@session.sql_require_primary_key=0*//*!*/;
ALTER TABLE orders ADD order_date DATETIME DEFAULT CURRENT_TIMESTAMP
/*!*/;
# at 1421
#250204 18:07:09 server id 1  end_log_pos 1500 CRC32 0x3bb4d029 	Anonymous_GTID	last_committed=5	sequence_number=6	rbr_only=yes	original_committed_timestamp=1738688829472568	immediate_commit_timestamp=1738688829472568	transaction_length=342
/*!50718 SET TRANSACTION ISOLATION LEVEL READ COMMITTED*//*!*/;
# original_commit_timestamp=1738688829472568 (2025-02-04 18:07:09.472568 CET)
# immediate_commit_timestamp=1738688829472568 (2025-02-04 18:07:09.472568 CET)
/*!80001 SET @@session.original_commit_timestamp=1738688829472568*//*!*/;
/*!80014 SET @@session.original_server_version=80041*//*!*/;
/*!80014 SET @@session.immediate_server_version=80041*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 1500
#250204 18:07:09 server id 1  end_log_pos 1575 CRC32 0xf1bd1668 	Query	thread_id=23	exec_time=0	error_code=0
SET TIMESTAMP=1738688829/*!*/;
BEGIN
/*!*/;
# at 1575
#250204 18:07:09 server id 1  end_log_pos 1637 CRC32 0xa876932b 	Table_map: `test`.`users` mapped to number 112
# has_generated_invisible_primary_key=0
# at 1637
#250204 18:07:09 server id 1  end_log_pos 1732 CRC32 0xd02a6aa3 	Write_rows: table id 112 flags: STMT_END_F

BINLOG '
PUmiZxMBAAAAPgAAAGUGAAAAAHAAAAAAAAEABHRlc3QABXVzZXJzAAMDDw8EyACQAQYBAQACA/z/
ACuTdqg=
PUmiZx4BAAAAXwAAAMQGAAAAAHAAAAAAAAEAAgAD/wAGAAAABWZyYW5rEQBmcmFua0BleGFtcGxl
LmNvbQAHAAAABWdyYWNlEQBncmFjZUBleGFtcGxlLmNvbaNqKtA=
'/*!*/;
### INSERT INTO `test`.`users`
### SET
###   @1=6
###   @2='frank'
###   @3='frank@example.com'
### INSERT INTO `test`.`users`
### SET
###   @1=7
###   @2='grace'
###   @3='grace@example.com'
# at 1732
#250204 18:07:09 server id 1  end_log_pos 1763 CRC32 0xcba082b7 	Xid = 123
COMMIT/*!*/;
# at 1763
#250204 18:07:09 server id 1  end_log_pos 1842 CRC32 0xdb30cc5c 	Anonymous_GTID	last_committed=6	sequence_number=7	rbr_only=yes	original_committed_timestamp=1738688829479164	immediate_commit_timestamp=1738688829479164	transaction_length=300
/*!50718 SET TRANSACTION ISOLATION LEVEL READ COMMITTED*//*!*/;
# original_commit_timestamp=1738688829479164 (2025-02-04 18:07:09.479164 CET)
# immediate_commit_timestamp=1738688829479164 (2025-02-04 18:07:09.479164 CET)
/*!80001 SET @@session.original_commit_timestamp=1738688829479164*//*!*/;
/*!80014 SET @@session.original_server_version=80041*//*!*/;
/*!80014 SET @@session.immediate_server_version=80041*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 1842
#250204 18:07:09 server id 1  end_log_pos 1917 CRC32 0x364ef55e 	Query	thread_id=23	exec_time=0	error_code=0
SET TIMESTAMP=1738688829/*!*/;
BEGIN
/*!*/;
# at 1917
#250204 18:07:09 server id 1  end_log_pos 1981 CRC32 0x9be2d7ad 	Table_map: `test`.`products` mapped to number 113
# has_generated_invisible_primary_key=0
# at 1981
#250204 18:07:09 server id 1  end_log_pos 2032 CRC32 0x75a79c44 	Delete_rows: table id 113 flags: STMT_END_F

BINLOG '
PUmiZxMBAAAAQAAAAL0HAAAAAHEAAAAAAAEABHRlc3QACHByb2R1Y3RzAAMDDwQDyAAEBgEBAAID
/P8Ardfimw==
PUmiZyABAAAAMwAAAPAHAAAAAHEAAAAAAAEAAgAD/wAEAAAABkRvb2RhZArXZ0FEnKd1
'/*!*/;
### DELETE FROM `test`.`products`
### WHERE
###   @1=4
###   @2='Doodad'
###   @3=14.49               
# at 2032
#250204 18:07:09 server id 1  end_log_pos 2063 CRC32 0xd2727666 	Xid = 125
COMMIT/*!*/;
# at 2063
#250204 18:07:09 server id 1  end_log_pos 2142 CRC32 0x3719020b 	Anonymous_GTID	last_committed=7	sequence_number=8	rbr_only=yes	original_committed_timestamp=1738688829491803	immediate_commit_timestamp=1738688829491803	transaction_length=322
/*!50718 SET TRANSACTION ISOLATION LEVEL READ COMMITTED*//*!*/;
# original_commit_timestamp=1738688829491803 (2025-02-04 18:07:09.491803 CET)
# immediate_commit_timestamp=1738688829491803 (2025-02-04 18:07:09.491803 CET)
/*!80001 SET @@session.original_commit_timestamp=1738688829491803*//*!*/;
/*!80014 SET @@session.original_server_version=80041*//*!*/;
/*!80014 SET @@session.immediate_server_version=80041*//*!*/;
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 2142
#250204 18:07:09 server id 1  end_log_pos 2226 CRC32 0x8c55721d 	Query	thread_id=23	exec_time=0	error_code=0
SET TIMESTAMP=1738688829/*!*/;
BEGIN
/*!*/;
# at 2226
#250204 18:07:09 server id 1  end_log_pos 2282 CRC32 0xb055d53c 	Table_map: `test`.`orders` mapped to number 114
# has_generated_invisible_primary_key=0
# at 2282
#250204 18:07:09 server id 1  end_log_pos 2354 CRC32 0x15ba88e7 	Update_rows: table id 114 flags: STMT_END_F

BINLOG '
PUmiZxMBAAAAOAAAAOoIAAAAAHIAAAAAAAEABHRlc3QABm9yZGVycwAEAwMDEgEADgEBADzVVbA=
PUmiZx8BAAAASAAAADIJAAAAAHIAAAAAAAEAAgAE//8AAwAAAAMAAAABAAAAmbXJIckAAwAAAAMA
AAACAAAAmbXJIcnniLoV
'/*!*/;
### UPDATE `test`.`orders`
### WHERE
###   @1=3
###   @2=3
###   @3=1
###   @4='2025-02-04 18:07:09'
### SET
###   @1=3
###   @2=3
###   @3=2
###   @4='2025-02-04 18:07:09'
# at 2354
#250204 18:07:09 server id 1  end_log_pos 2385 CRC32 0xa1513683 	Xid = 127
COMMIT/*!*/;
SET @@SESSION.GTID_NEXT= 'AUTOMATIC' /* added by mysqlbinlog */ /*!*/;
DELIMITER ;
# End of log file
/*!50003 SET COMPLETION_TYPE=@OLD_COMPLETION_TYPE*/;
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=0*/;
