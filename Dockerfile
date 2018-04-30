FROM golang:alpine AS build
RUN apk add git --no-cache && \
    go get -u -v honnef.co/go/nut/cmd/nut_exporter && \
    go get -t -v ./...

FROM alpine:latest
COPY --from=build /go/bin/nut_exporter /usr/local/bin/nut_exporter
EXPOSE 9230
ENTRYPOINT ["/usr/local/bin/nut_exporter"]