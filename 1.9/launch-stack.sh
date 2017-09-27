#!/bin/bash



MYSQL_ROOT_PASSWORD=changeme


#start db
docker run --name idoit-mariadb \
	   --restart=unless-stopped \
           -v /srv/docker/stack-mariadb-idoit/mysql-conf.d:/etc/mysql/conf.d \
           -v /srv/mariadb-data:/var/lib/mysql \
           -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
           -d mariadb:10.1


#start webapp
docker run --name idoit-apache \
           -p 80:80 \
           -t \
	   --restart=unless-stopped \
           --link idoit-mariadb:mysql \
           -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
	   -d idoit-apache:1.9.3 
