# Use the official Golang image as the base image
FROM golang:1.17-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy the Go modules and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code to the container
COPY . .

# Build the Go application
RUN go build -o /go/bin/webapp

# Use a smaller base image for the final image
FROM alpine:3.15

# Set the working directory
WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /go/bin/webapp .

# Expose the port that the application will run on
EXPOSE 8080

# Command to run the application
CMD ["./webapp"]
