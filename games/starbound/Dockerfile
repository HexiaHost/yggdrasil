FROM debian:stable-slim

LABEL author="HexiaHost LLC." maintainer="support@hexiahost.net"

LABEL org.opencontainers.image.source="https://github.com/HexiaHost/yggdrasil"
LABEL org.opencontainers.image.licenses=MIT

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 \
    && apt update \
    && apt upgrade -y \
    && apt install -y libssl1.1:i386 libtinfo6:i386 libtbb2:i386 libtinfo5:i386 libcurl4-gnutls-dev:i386 libcurl4:i386 libncurses5:i386 libcurl3-gnutls:i386 libtcmalloc-minimal4:i386 faketime:i386 libtbb2:i386 libvorbisfile3 \
    && apt install -y jq wget unzip curl iproute2 \
    && useradd -d /home/container -m container

USER container
ENV HOME /home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
