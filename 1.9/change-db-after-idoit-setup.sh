#!/bin/bash

MYSQL_ROOT_PASSWORD=changeme

docker exec -t idoit-mariadb sh -c "echo \"update mysql.user set Host='%' where User=idoit;\" | mysql -p$MYSQL_ROOT_PASSWORD"
docker exec -t idoit-mariadb sh -c "echo \"update mysql.db set Host='%' where User='idoit'; flush privileges; \" | mysql -p$MYSQL_ROOT_PASSWORD"


