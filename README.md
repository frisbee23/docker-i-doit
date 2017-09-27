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

1) build the image
```bash
git clone docker-i-doit && cd docker-i-doit/1.9
docker build -t i-doit:1.9 .
```

2a) set mysql password 
```bash
vim launch-stack.sh initialize-db-once.sh change-db-after-idoit-setup.sh # set a new password in these lines -> MYSQL_ROOT_PASSWORD=changeme
```
2b) start database & app
```bash
chmod +x launch-stack.sh; ./launch-stack.sh
```

3) while the database is running change a few things which are not yet automated
```bash
chmod +x initialize-db-once.sh; ./initialize-db-once.sh
```

4)Point your browser to `http://thehost:80/i-doit/` and complete the installation steps.

5)chmod +x change-db-after-idoit-setup.sh;  ./change-db-after-idoit-setup.sh

6) Point your browser to `http://thehost:80/i-doit/` - you should be able to use i-doit now





