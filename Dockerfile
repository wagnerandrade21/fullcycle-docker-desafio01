FROM golang:1.21.5 as builder
WORKDIR /usr/src/app
COPY ./src ./
RUN go mod download && go mod verify
RUN go build -v -o /usr/local/bin/app ./...

FROM scratch
COPY --from=builder /usr/local/bin/app /usr/local/bin/app
CMD ["app"]
