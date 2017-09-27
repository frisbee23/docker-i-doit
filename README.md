# i-doit 1.9

docker image for the open source CMDB [i-doit] (http://www.i-doit.org).
based on: 
- the awesome work of the guys i forked this from
- https://kb.i-doit.com/display/en/Manual+Installation -> Debian
- https://kb.i-doit.com/display/en/Setup


**Beware**
The docker image can be used to explore `i-doit` functionality and for evaluation purposes. 
It is neither prepared nor tested for a production installation.

this readme is work in progress.



## Walkthrough on install/first launch 

-) build the image:
```bash
git clone docker-i-doit && cd docker-i-doit/1.9
docker build -t i-doit:1.9 .
```

-) set mysql password:
```bash
vim launch-stack.sh initialize-db-once.sh change-db-after-idoit-setup.sh # set a new password in these lines -> MYSQL_ROOT_PASSWORD=changeme
```
-) start database & app:
```bash
chmod +x launch-stack.sh; ./launch-stack.sh
```

-) we now need to change a few things (which are sadly not yet automated):
```bash
chmod +x initialize-db-once.sh; ./initialize-db-once.sh
docker stop idoit-mariadb
mv  /srv/mariadb-data/ib_logfile[01] /tmp

```

-) start the database again:
```bash
docker start idoit-mariadb
```

-) Point your browser to `http://thehost:80/i-doit/` and complete the installation steps. the installation should finish, but then you will be unable to login yet, because...

-) the automatic installation creates an idoit mysql user, but it can only login from localhost, so we change it to be able to login from anywhere:
```bash
chmod +x change-db-after-idoit-setup.sh;  ./change-db-after-idoit-setup.sh
```

-) Point your browser again to `http://thehost:80/i-doit/` - you should be able to log in and use i-doit now





