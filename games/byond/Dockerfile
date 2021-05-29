FROM tgstation/byond:513.1536

LABEL author="HexiaHost LLC." maintainer="support@hexiahost.net"

LABEL org.opencontainers.image.source="https://github.com/HexiaHost/yggdrasil"
LABEL org.opencontainers.image.licenses=MIT

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends iproute2 curl ca-certificates libssl-dev pkg-config gcc-multilib mariadb-client libssl1.0.0 \
    && useradd -d /home/container -m container

USER container
ENV HOME /home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
