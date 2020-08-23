FROM jrottenberg/ffmpeg:snapshot-ubuntu
LABEL maintainer "Gordon Schulz <gordon.schulz@gmail.com>"

RUN set -x && \
    apt-get update && \
    apt-get -y install zsh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /transcode
COPY ./rootfs /
