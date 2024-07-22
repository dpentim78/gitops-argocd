FROM golang:1.21 as builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o server

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/server .
EXPOSE 8080
CMD ["./server"]










# # Use a lightweight base image
# FROM golang:1.21 as builder

# # Set the working directory
# WORKDIR /app

# # Copy your Go source code to the container
# COPY . .

# # Build your Go application
# RUN CGO_ENABLED=0 GOOS=linux go build -o server

# # Use a minimal base image for the final image
# FROM alpine:latest

# # Set the working directory
# WORKDIR /app

# # Copy the binary from the builder stage
# COPY --from=builder /app/server .

# # Expose the port your application will run on
# EXPOSE 8080

# # Start your Go application
# CMD ["./server"]
