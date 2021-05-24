FROM debian:stable-slim

LABEL author="HexiaHost LLC." maintainer="support@hexiahost.net"

LABEL org.opencontainers.image.source="https://github.com/HexiaHost/yggdrasil"
LABEL org.opencontainers.image.licenses=MIT

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends --no-install-suggests ca-certificates curl lib32gcc1 libsdl2-2.0-0:i386 \
    && mkdir -p /root/steamcmd \
    && curl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
    && tar -xzvf steamcmd.tar.gz -C /root/steamcmd/ \

WORKDIR /root/steamcmd
