FROM --platform=$BUILDPLATFORM quay.io/projectquay/golang:1.20 as builder

WORKDIR /go/src/app
COPY . .
ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM" > /log
RUN make build

FROM scratch
WORKDIR /
COPY --from=builder /go/src/app/webserv .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt  /etc/ssl/certs/
ENTRYPOINT ["./webserv"]