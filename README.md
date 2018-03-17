# Go RESTful Application Starter Kit

This starter kit is meant to get you up and running with a Go project for developing RESTful services in Go.

The following Go packages have been used:

* [Echo](https://echo.labstack.com) - High performance, minimalist Go web framework
* [Dep](https://golang.github.io/dep/) - Go dependency management tool
* [Realize](https://gorealize.io) - Golang Task Runner which enhance your workflow by automating the most common tasks and using the best performing Golang live reloading.

## Getting started

These instructions will get you a copy of the project up and running on your local machine for development, testing and building docker image.

### Requirements

* [Docker](https://docs.docker.com/get-started/) 17.09.0+
* [Docker Compose](https://docs.docker.com/compose/) 3.4+

### Commands

Start live-reload dev environment

```sh
$ make dev.up
#$ docker-compose up api
```

Add new dependency (package)

```sh
$ make dev.add.pkg {{package_url}}
#$ docker-compose run --rm api dep ensure -add {{package_url}}
```

Build docker image

```sh
$ make build
```

Run docker image

```sh
$ make run
```