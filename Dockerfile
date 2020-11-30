FROM jrottenberg/ffmpeg:snapshot-ubuntu
LABEL maintainer "Gordon Schulz <gordon.schulz@gmail.com>"

RUN set -x && \
    apt-get update && \
    apt-get -y install zsh git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/azmodude/ffmpeg-transcode \
    /tmp/ffmpeg-transcode && mv /tmp/ffmpeg-transcode/*.sh /usr/local/bin && \
    rm -rf /tmp/ffmpeg-transcode

WORKDIR /transcode
