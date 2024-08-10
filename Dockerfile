# Stage 1: Build Filestash
FROM golang:1.20-alpine AS build_filestash

WORKDIR /app
RUN apk add --no-cache git

# Clone the Filestash repo
RUN git clone https://github.com/mickael-kerjean/filestash.git .

# Build the Filestash binary
RUN go build -o filestash .

# Stage 2: Set up the final image with Filestash and OnlyOffice
# Use the official OnlyOffice Docker image for the Raspberry Pi architecture
FROM onlyoffice/documentserver:latest

# Install additional dependencies if needed
RUN apt-get update && apt-get install -y \
    supervisor && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy Filestash binary from build stage
COPY --from=build_filestash /app/filestash /usr/local/bin/filestash

# Expose default ports
EXPOSE 8334 8088

# Copy the run.sh script
COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Copy supervisor configuration if needed
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Start both Filestash and OnlyOffice Document Server
ENTRYPOINT ["/usr/local/bin/run.sh"]