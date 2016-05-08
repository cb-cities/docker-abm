# Docker image for CA-ABM
> Krishna Kumar

[Docker image](https://hub.docker.com/r/cbgeo/ca-abm/)

## Tools
* GHC 7.10.3
* Cabal 1.22.2
* GCC 5.3.1

# Creating an image from the docker file

* To build an image from docker file run as root `docker build -t "cbgeo/ca-abm:v0.1" /path/to/Dockerfile`
* `docker history` will show you the effect of each command has on the overall size of the file.

# Use the docker image

* The docker image can be used directly from the Docker Hub
* To launch the `cbgeo/ca-abm`  docker container, run `docker run -ti cbgeo/ca-abm:latest /bin/bash`
