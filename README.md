docker image for the open source CMDB [i-doit](http://www.i-doit.org).

**Beware**
The docker image can be used to explore `i-doit` functionality and for evaluation purposes. 
It is neither prepared nor tested for a production installation.

# i-doit 1.9

## Build, then launch

```bash
# build the image
% sudo docker build -t i-doit:1.9 https://github.com/Wachhund/docker-i-doit.git#:1.9

# run the application. Replace 8080 with a free port number on localhost.
% sudo docker run -p 8080:80 -t i-doit:1.9
```

Point your browser to `http://localhost:8080/i-doit/` and complete the installation steps.
Just keep the default values suggested by i-doit and click **Next** until the installation is
completed.

# i-doit 1.8

## Build, then launch

```bash
# build the image
% sudo docker build -t i-doit:1.8 https://github.com/Gubaer/docker-i-doit.git#:1.8

# run the application. Replace 8080 with a free port number on localhost.
% sudo docker run -p 8080:80 -t i-doit:1.8 
```

Point your browser to `http://localhost:8080/i-doit/` and complete the installation steps.
Just keep the default values suggested by i-doit and click **Next** until the installation is
completed.


## Pull from docker hub, then launch

```bash
# pull from docker hub
% sudo docker pull gubaer/i-doit:1.8

# run the application. Replace 8080 with a free port number on localhost.
% sudo docker run -p 8080:80 -t gubaer/i-doit:1.8
```

Point your browser to `http://localhost:8080/i-doit/` and complete the installation steps.
Just keep the default values suggested by i-doit and click **Next** until the installation is
completed.


# i-doit 1.4.7

## Build, then launch

```bash
# build the image
% sudo docker build -t i-doit:1.4.7 https://github.com/Gubaer/docker-i-doit.git#:1.4.7

# run the application. Replace 8080 with a free port number on localhost.
% sudo docker run -p 8080:80 -t i-doit:1.4.7 
```

Point your browser to `http://localhost:8080/i-doit/` and complete the installation steps.
Just keep the default values suggested by i-doit and click **Next** until the installation is
completed.


## Pull from docker hub, then launch

```bash
# pull from docker hub
% sudo docker pull gubaer/i-doit:1.4.7

# run the application. Replace 8080 with a free port number on localhost.
% sudo docker run -p 8080:80 -t gubaer/i-doit:1.4.7
```

Point your browser to `http://localhost:8080/i-doit/` and complete the installation steps.
Just keep the default values suggested by i-doit and click **Next** until the installation is
completed.






