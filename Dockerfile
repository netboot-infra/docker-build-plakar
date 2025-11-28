# Use the official Golang base image
FROM golang:1.22

# Create a non-root user with UID/GID 1000
RUN addgroup --gid 1000 appgroup && \
    adduser --uid 1000 --gid 1000 --disabled-password --gecos "" appuser

# Install Plakar Go binary
RUN go install github.com/PlakarKorp/plakar@v1.0.5

# Define persistent storage and expose the application port
VOLUME /var/kloset
EXPOSE 8080

# Switch to the non-root user
USER 1000:1000

# Default command to run the application
CMD ["/go/bin/plakar", "-no-agent", "at", "/var/kloset", "ui", "-addr", "0.0.0.0:8080", "-no-spawn", "-no-auth"]
