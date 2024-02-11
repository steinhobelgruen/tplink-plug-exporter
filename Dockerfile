FROM golang:1.18 as builder

COPY . /src
WORKDIR /src
RUN CGO_ENABLED=0 go build main.go

FROM alpine:3.12.1
COPY --from=builder /src/main /tplink-plug-exporter
EXPOSE 9233
ENTRYPOINT ["/tplink-plug-exporter"]
