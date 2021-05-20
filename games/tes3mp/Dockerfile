FROM debian:stable-slim

LABEL author="HexiaHost LLC." maintainer="support@hexiahost.net"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
    && apt-get install -y curl libgl1-mesa-glx libluajit-5.1-2 libssl1.1

USER container
ENV HOME /home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
