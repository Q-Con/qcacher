# qcacher - CDN cache and passthrough utility


## Introduction

qcacher is a service designed for efficiently and correctly caching content
from various providers.


## Getting Started

### Running the application

To get started with this application you will require [docker][docker] and
[docker-compose][docker-compose]. If you don't have these tools installed
please see the section of [installing them](#installing-docker).

Once you have these tools installed, it is a as simple as running `make run`
in the root of the repository to start all the required services as separate
docker containers, orchestrated by docker-compose.


## Appendices

### Installing Docker

**NOTE:** The minimum required version of docker is 1.7.

#### Linux

Docker is best supported on Linux, you can probably find packages for your
preferred distribution [here][docker_install].

#### OSX

Install Docker and boot2docker following the instructions on
[this page][docker_osx_install].

#### Windows

Not supported yet (we just haven't tried, give it a go, it might work). Pull
requests very welcome.

[docker]: https://docker.io  "Docker"
[docker_install]: https://docs.docker.com/installation/  "Docker Installation"
[docker-compose]: https://docs.docker.com/compose/
[docker_osx_install]: https://docs.docker.com/installation/mac/  "Docker"
