# server_performance_stats
Simple Script to see the performance of a linux server

# Instructions
`docker build -t server-stats .`

`docker run --rm server-stats`

## If looking to work interactively within the container
`docker run -it ubuntu:latest /bin/bash`

`apt update && apt install -y procps psutils coreutils lsb-release whois grep sed gawk vim`

Paste or copy script into the directory you want to work in

`bash server_stats.sh`