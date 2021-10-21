FROM mcr.microsoft.com/dotnet/core/sdk:5.0

LABEL author="HexiaHost LLC." maintainer="support@hexiahost.net"

LABEL org.opencontainers.image.source="https://github.com/HexiaHost/yggdrasil"
LABEL org.opencontainers.image.licenses=MIT

RUN apt-get update -y \
    && apt-get install -y iproute2 curl ca-certificates openssl git \
    && useradd -d /home/container -m container

USER container
ENV HOME /home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
