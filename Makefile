GIT_COMMIT ?= $(shell git rev-parse --short HEAD)
GOPATH = /go/src/github.com/alvin-huang/multiply
DOCKER_TAG = multiply:latest

docker:
	docker build -t $(DOCKER_TAG) .

## Run Tests
test: docker
	echo "Running Tests"
	docker run --rm -v $(CURDIR):$(GOPATH) -w $(GOPATH) $(DOCKER_TAG) go test

## Only run tests for PRs
pr: test

## Feature
feature: docker test
	docker run --rm -v $(CURDIR):$(GOPATH) -w $(GOPATH) $(DOCKER_TAG) go build -o "bin/multiply-${GIT_COMMIT}"

## Release
release: docker test
	docker run --rm -v $(CURDIR):$(GOPATH) -w $(GOPATH) $(DOCKER_TAG) go build -o "bin/multiply"
