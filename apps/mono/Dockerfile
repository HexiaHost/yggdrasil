FROM mono:6

LABEL author="HexiaHost LLC." maintainer="support@hexiahost.net"

ENV DEBIAN_FRONTEND=noninteractive

RUN && apt update \
    && apt upgrade -y \
    && apt install -y iproute2 ca-certificates unzip sqlite fontconfig

USER container
ENV HOME /home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
