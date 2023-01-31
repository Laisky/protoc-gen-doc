FROM golang:1.19.5-alpine3.17 AS build

WORKDIR /app

COPY go.mod .
COPY go.sum .
RUN go mod download

ADD .  .
RUN go build -o protoc-gen-doc ./cmd/protoc-gen-doc

FROM alpine:3.17.1

WORKDIR /

RUN apk --update add bash protoc protobuf-dev && rm -rf /var/cache/apk/*

COPY LICENSE.md README.md script/entrypoint.sh ./
COPY --from=build /app/protoc-gen-doc /usr/bin/.

VOLUME ["/out"]
VOLUME ["/protos"]

ENTRYPOINT ["./entrypoint.sh"]
CMD ["--doc_opt=html,index.html"]
