FROM golang

RUN go install github.com/PlakarKorp/plakar@v1.0.5

VOLUME /var/kloset
EXPOSE 8080

CMD ["/go/bin/plakar", "-no-agent", "at", "/var/kloset", "ui", "-addr", "0.0.0.0:8080", "-no-spawn", "-no-auth"]