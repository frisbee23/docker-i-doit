docker image for the open source CMDB [i-doit](http://www.i-doit.org).

**Beware**
The docker image can be used to explore `i-doit` functionality and for evaluation purposes. 
It is neither prepared nor tested for a production installation.

# i-doit 1.9

## Build, then launch

```bash
# build the image
git clone docker-i-doit && cd docker-i-doit
docker build -t i-doit:1.9 .

# run the application. 
./launch-stack.sh
```

## to install plugins

```bash
docker exec -ti idoit-apache bash
cd /var/www/html/i-doit/ && ./idoit-rights set
#### now install plugins/addons, while the idoit-dir's are writeable
#### don't forget to take a note, that if you update the docker image, or delete the active container to re-do the installing
# when done set safer rights again:
cd /var/www/html/i-doit/ && ./idoit-rights unset


Point your browser to `http://thehost:80/i-doit/` and complete the installation steps.

this readme is a stub, and will be updated hopefully pretty soon.



