# Stage 1: Build Filestash
FROM golang:1.20-alpine AS build_filestash

WORKDIR /app
RUN apk add --no-cache git

# Clone the Filestash repo
RUN git clone https://github.com/mickael-kerjean/filestash.git .

# Build the Filestash binary
RUN go build -o filestash .

# Stage 2: Set up the final image with Filestash and OnlyOffice
FROM ubuntu:22.04

# Install dependencies for OnlyOffice Document Server and supervisor
RUN apt-get update && apt-get install -y \
    wget gnupg2 apt-transport-https software-properties-common supervisor && \
    wget -qO - https://download.onlyoffice.com/repo/onlyoffice.asc | apt-key add - && \
    add-apt-repository "deb https://download.onlyoffice.com/repo/debian squeeze main" && \
    apt-get update && apt-get install -y onlyoffice-documentserver && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy Filestash binary from build stage
COPY --from=build_filestash /app/filestash /usr/local/bin/filestash

# Expose default ports (these can be overridden by user configuration)
EXPOSE 8334 8088

# Copy the run.sh script
COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Copy supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Start both Filestash and OnlyOffice Document Server
ENTRYPOINT ["/usr/local/bin/run.sh"]