GIT_COMMIT ?= $(shell git rev-parse --short HEAD)
GOPATH ?= /go/src/github.com/jankins-poc/go-xml-test
DOCKER_TAG = go-xml-test:latest

docker-build:
	docker build -t $(DOCKER_TAG) .

## Run Tests
test: docker-build
	echo "Running Tests"
	docker run --rm -v /private/$(CURDIR):$(GOPATH) -w $(GOPATH) $(DOCKER_TAG) bash -c "go test -v | go2xunit -output test.xml"

bin: docker-build test
	echo "Making Binary"
	docker run --rm -v /private/$(CURDIR):$(GOPATH) -w $(GOPATH) $(DOCKER_TAG) go build -o "bin/go-xml-test"
