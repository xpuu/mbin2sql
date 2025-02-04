#!/usr/bin/env bash
/entrypoint.sh mysqld "$@" &

sleep 15
until mysqladmin ping --protocol tcp --silent; do
  sleep 1
done
echo Mysql initialization done

config="/etc/mysql/conf.d/client.cnf"
if [ ! -f $config ]; then
  echo -e "[client]\npassword=\"${MYSQL_ROOT_PASSWORD}\"" > $config
fi

tail -f /dev/null
