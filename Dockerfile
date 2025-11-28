# Use the official Golang base image
FROM golang:1.24

# Create a non-root user with UID/GID 1000
RUN addgroup --gid 1000 appgroup && \
    adduser --uid 1000 --gid 1000 --disabled-password --gecos "" appuser

# Install Plakar Go binary
RUN go install github.com/PlakarKorp/plakar@v1.0.5

# Switch to the non-root user
USER 1000:1000

# Set environment variables
ENV PLAKAR_REPOSITORY=/data
ENV PLAKAR_PASSPHRASE=""

# Expose the application port
EXPOSE 8080

# Health check to ensure the service is running
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/ || exit 1

# Default command to start the UI
# Users can override with custom arguments
CMD ["/go/bin/plakar", "-no-agent", "ui", "-addr", "0.0.0.0:8080", "-no-spawn", "-no-auth"]
