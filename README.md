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
