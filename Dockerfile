# Use Ubuntu as base image
FROM ubuntu:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y procps psutils coreutils lsb-release whois grep sed gawk

# Copy the script to the container
COPY server_stats.sh /usr/local/bin/server_stats.sh

# Make the script executable
RUN chmod +x /usr/local/bin/server_stats.sh

# Set the entrypoint to run the script
ENTRYPOINT ["/usr/local/bin/server_stats.sh"]