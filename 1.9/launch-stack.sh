#!/bin/bash
#https://hub.docker.com/_/mariadb/

echo "after changing the dockerimage, don't forget to build it! 



"

MYSQL_ROOT_PASSWORD=changeme
# see crontab for backup

#start db
docker run --name idoit-mariadb \
	   --restart=unless-stopped \
           -v /srv/docker/stack-mariadb-idoit/mysql-conf.d:/etc/mysql/conf.d \
           -v /srv/mariadb-data:/var/lib/mysql \
           -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
           -d mariadb:10.1

###### this is part of the idoit installation, only needed with a fresh database
# enable password login, becuase idoit setup needs it
#docker exec -t idoit-mariadb sh -c "echo \"UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE User = 'root'; FLUSH PRIVILEGES;\" | mysql -p$MYSQL_ROOT_PASSWORD"

# shutdown with innodb, to be able to move the files away, for idoit, performance
#docker exec -t idoit-mariadb sh -c "mysql -uroot -p$MYSQL_ROOT_PASSWORD -e\"SET GLOBAL innodb_fast_shutdown = 0\""
#mv  /srv/mariadb-data/ib_logfile[01] /tmp

# idoit setup 
#update mysql.user set Host='%' where User=idoit;
#update mysql.db set Host='%' where User='idoit';
#
#start webapp
docker run --name idoit-apache \
           -p 80:80 \
           -t \
	   --restart=unless-stopped \
           --link idoit-mariadb:mysql \
           -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
	   -d idoit-apache:1.9.3 
