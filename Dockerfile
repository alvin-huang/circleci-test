FROM golang:1.10.1-stretch

RUN apt-get install make
RUN go get github.com/tebeka/go2xunit
