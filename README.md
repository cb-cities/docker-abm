# Docker image for CA-ABM
> Krishna Kumar

[Docker image](https://quay.io/repository/cbgeo/ca-abm)
[![Docker Repository on Quay](https://quay.io/repository/cbgeo/ca-abm/status "Docker Repository on Quay")](https://quay.io/repository/cbgeo/ca-abm)
[Docker image](https://hub.docker.com/r/cbgeo/ca-abm/)

## Tools
* GHC 7.10.3
* Cabal 1.22.2
* GCC 5.3.1

# Creating an image from the docker file

* To build an image from docker file run as root `docker build -t "cbgeo/ca-abm:v0.1" /path/to/Dockerfile`
* `docker history` will show you the effect of each command has on the overall size of the file.

# Use the docker image
* The docker image can be used directly from the Quay.io or Docker Hub
* Pull the docker image `docker pull quay.io/cbgeo/ca-abm`
* To launch the `cbgeo/ca-abm`  docker container, run `docker run -ti cbgeo/ca-abm:latest /bin/bash`

## Run the container with local volume mounted
* `docker run -ti -v /home/<user>/<mounted-folder>/:/<path-in-container> cbgeo/ca-abm:latest /bin/bash`

## Exposing ports
* To connect to a particular port (for e.g., 3000) in docker container to port `3000` in localhost: `docker run -ti -p 3000:3000 cbgeo/ca-abm`
