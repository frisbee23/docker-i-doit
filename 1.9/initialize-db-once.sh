#!/bin/bash


MYSQL_ROOT_PASSWORD=changeme


###### this is part of the idoit installation, only needed with a fresh database
# enable password login, becuase idoit setup needs it
docker exec -t idoit-mariadb sh -c "echo \"UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE User = 'root'; FLUSH PRIVILEGES;\" | mysql -p$MYSQL_ROOT_PASSWORD"

# shutdown with innodb, to be able to move the files away, for idoit, performance
#docker exec -t idoit-mariadb sh -c "mysql -uroot -p$MYSQL_ROOT_PASSWORD -e\"SET GLOBAL innodb_fast_shutdown = 0\""
mv  /srv/mariadb-data/ib_logfile[01] /tmp
