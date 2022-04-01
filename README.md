# qcacher - eSports & Gaming CDN cache service


* [Introduction](#introduction)
* [Supported services](#supported-services)
* [Components](#components)
* [Getting Started](#getting-started)


## Introduction

qcacher is a service designed for long-term caching of various content
networks related to gaming. It is designed not only to maximize efficiency of
fast connections with multiple clients, but also deliver long-term reliability
and resiliency of caching when paired with slow, or intermittent connections.


## Supported services

We currently support content caching and delivery for the following services:

* PlayStation Network (PS3, PS4, PS5)
* Xbox Live (**untested**)
* Epic Games (Store and Unreal Engine)
* Nintendo (3DS & Wii U)
* Blizzard (Starcraft 2, Hearthstone, etc.)
* Riot (League of Legends, Valorant, etc.)
* Steam (Broadcasts, Games, etc.)
* Origin (EA)
* Hi-Rez (Smite, etc.)
* PlanetSide 2
* Twitch.tv
* Microsoft Windows updates
* NVIDIA driver updates
* Mozilla Firefox


## Components

There are 2 components to this service:

* **nginx** - a fast, lightweight, and efficient web server configured to
  cache and store content from supported delivery networks, and passthrough
  HTTPS connections to overridden domains to ensure continued delivery
* **unbound** - a flexible and fast DNS server configured to override records
  of the services we support


## Getting Started

**NOTE:** This section is still incomplete. A simple tutorial will be available in the coming weeks.

### Running the application

To get started with this application you will require [docker][docker] and
[docker-compose][docker-compose]. If you don't have these tools installed
please see the section of [installing them](#installing-docker).

You should configure the following two environment variables in
`docker-compose.yml` to provide the service:

- `CACHE_IP` - the IPv4 address of the host running qcacher that clients can connect to
- `CACHE_SUBNET` - the IPv4 subnet that qcacher should cache for (e.g. `192.168.0.0/16`)

DNS for the affected clients should be provided by qcacher.

Once you have Docker installed and the IP configured, it is a as simple as
running `docker-compose up` in the root of the repository to start all the
required services.


## Appendices

### Installing Docker

**NOTE:** You will need Docker Compose 1.6.0+ and Docker Engine 1.10.0+ as a minimum to run this project.

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
