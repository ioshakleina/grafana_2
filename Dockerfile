# Use the official Golang image
FROM golang:latest

# Set the working directory
WORKDIR /app

# Copy the Go application source code
COPY . .

# Build the Go application
RUN go build -o webapp

# Expose the port on which the application will run
EXPOSE 8080

# Command to run the application
CMD ["./webapp"]
