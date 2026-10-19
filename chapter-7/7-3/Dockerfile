FROM ubuntu:22.04

# Avoid interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Install base dependencies
RUN apt-get update && \
    apt-get install -y \
      ca-certificates \
      git \
      bash && \
    rm -rf /var/lib/apt/lists/*

# Copy embedded script into the image
COPY prepare.sh /usr/local/bin/prepare.sh

# Ensure it is executable
RUN chmod +x /usr/local/bin/prepare.sh

# Default command (can be overridden by the workflow)
ENTRYPOINT ["/usr/local/bin/prepare.sh"]
