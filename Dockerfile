ARG GO_VERSION=latest

#
# dev image
#
FROM golang:${GO_VERSION} AS dev

# Go dependency management tool 
RUN go get -u github.com/golang/dep/cmd/dep

# Golang live reload and task runner
RUN go get -u github.com/oxequa/realize


#
# builder image
# 
FROM golang:${GO_VERSION} as builder

WORKDIR /go/src/project
# Copy the current code into our workdir
COPY . .

# godep - dependency manager tool,
RUN go get -u github.com/golang/dep/cmd/dep
# Create a dep project, and run `ensure`, which will pull in all 
# of the dependencies within this directory.
RUN dep ensure -vendor-only
# Build the binary, with a few flags which will allow
# us to run this binary in Alpine. 
RUN CGO_ENABLED=0 GOOS=linux go build  -o app -a -installsuffix cgo .

# 
# release image
#
FROM alpine:latest AS release

# Security related package, good to have.
RUN apk --no-cache add ca-certificates

# Same as before, create a directory for our app.
RUN mkdir /app
WORKDIR /app

# Here, instead of copying the binary from our host machine,
# we pull the binary from the container named `builder`, within
# this build context.
COPY --from=builder /go/src/project/app .

# Run the binary as per usual! This time with a binary build in a
# separate container, with all of the correct dependencies and
# run time libraries.
CMD ["./app"]



LABEL version="1.0" \
	maintainer="trajkovvane@gmail.com"

