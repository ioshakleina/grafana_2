# Golang image -  base image
FROM golang:1.17-alpine AS builder

# working directory
WORKDIR /app

#  download dependencies
COPY go.mod go.sum ./
RUN go mod download

COPY . .

# Build 
RUN go build -o /go/bin/webapp

FROM alpine:3.15

# working directory
WORKDIR /app

COPY --from=builder /go/bin/webapp .

EXPOSE 8080

# run the application
CMD ["./webapp"]
