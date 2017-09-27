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

Point your browser to `http://thehost:80/i-doit/` and complete the installation steps.

this readme is a stub, and will be updated hopefully pretty soon.



