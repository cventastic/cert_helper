FROM alpine:latest

# install git go openssl bash
RUN apk add --no-cache git make musl-dev go openssl bash

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin


# clone certstrap for CA generation
RUN git clone https://github.com/square/certstrap
WORKDIR /certstrap
RUN go build

WORKDIR /
COPY entrypoint.sh entrypoint.sh

CMD [ "bash", "/entrypoint.sh" ]