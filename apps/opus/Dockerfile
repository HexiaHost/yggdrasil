FROM debian:bookworm-slim

LABEL author="HexiaHost LLC." maintainer="support@hexiahost.net"

LABEL org.opencontainers.image.source="https://github.com/HexiaHost/yggdrasil"
LABEL org.opencontainers.image.licenses=MIT

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y \
    && apt-get install -y iproute2 tzdata curl ca-certificates openssl git libopus-dev opus-tools \
    && useradd -d /home/container -m container \
    && rm -rf /var/lib/apt/lists/*

USER container
ENV HOME /home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
