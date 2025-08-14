FROM alpine:latest

# Install required tools
RUN apk add --no-cache wget unzip ca-certificates

# Set working directory
WORKDIR /app

# Download latest V2Ray release
RUN wget https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
    && unzip v2ray-linux-64.zip \
    && rm v2ray-linux-64.zip \
    && rm config.json

# Copy custom config into container
COPY config.json /app

# Expose TLS port
EXPOSE 443

# Run V2Ray
ENTRYPOINT ["./v2ray", "run"]
