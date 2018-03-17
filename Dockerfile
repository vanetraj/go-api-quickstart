ARG GO_VERSION=latest

FROM golang:${GO_VERSION} AS dev

# Go dependency management tool 
RUN go get -u github.com/golang/dep/cmd/dep

# Golang live reload and task runner
RUN go get -u github.com/oxequa/realize

LABEL version="1.0" \
	maintainer="trajkovvane@gmail.com"

