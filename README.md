# Docker image for CA-ABM
> Krishna Kumar


[![Docker image](https://img.shields.io/badge/docker--image-cbgeo--ca--abm-ff69b4.svg)](https://quay.io/repository/cbgeo/ca-abm)
[![Docker Repository on Quay](https://quay.io/repository/cbgeo/ca-abm/status "Docker Repository on Quay")](https://quay.io/repository/cbgeo/ca-abm)
[![Build status](https://api.travis-ci.org/cb-geo/docker-abm.svg)](https://api.travis-ci.org/cb-geo/docker-abm.svg)
[![Docker hub](https://img.shields.io/badge/docker--hub-cbgeo--ca--abm-ff69b4.svg)](https://hub.docker.com/r/cbgeo/ca-abm/)

## Tools
* GHC 8.0.1
* Cabal 1.24
* GCC 6
* Node 6.3.1

# Creating an image from the docker file
* To build an image from docker file run as root `docker build -t "cbgeo/ca-abm:latest" /path/to/Dockerfile`
* `docker history` will show you the effect of each command has on the overall size of the file.

# Using the docker image
* The docker image can be used directly from the Docker Hub or Quay.io
* Pull the docker image `docker pull cbgeo/ca-abm` or `docker pull quay.io/cbgeo/ca-abm`
* To launch the `cbgeo/ca-abm`  docker container, run `docker run -ti cbgeo/ca-abm:latest /bin/bash` or `docker run -ti quay.io/cbgeo/ca-abm:latest /bin/bash`

## Run the container with local volume mounted
* `docker run -ti -v /home/<user>/<mounted-folder>/:/<path-in-container> cbgeo/ca-abm:latest /bin/bash`

## Exposing ports
* To connect to a particular port (for e.g., 3000) in docker container to port `3000` in localhost: `docker run -ti -p 3000:3000 cbgeo/ca-abm`
