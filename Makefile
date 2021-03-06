-include .env.mk

.env.mk: .env
		sed 's/"//g ; s/=/:=/' < $< > $@

IMAGE := azmo/ffmpeg-transcode
USER_UID := $(shell id -u)
USER_GID := $(shell id -g)

build:
	/usr/bin/docker build -t $(IMAGE) .

shell:
	/usr/bin/docker run --rm -it -u $(USER_UID):$(USER_GID) \
		-e COLUMNS="`tput cols`" -e LINES="`tput lines`"\
		-v $(WORKDIR):/transcode --entrypoint /bin/bash $(IMAGE)

