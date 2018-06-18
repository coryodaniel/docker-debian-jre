.PHONY: build shell release

IMAGE_NAME := debian-jre

build:
	docker build -t ${IMAGE_NAME} .

release: REL_TIME=$(shell date +%s)
release:
	docker tag ${IMAGE_NAME}:latest coryodaniel/${IMAGE_NAME}:latest && \
	docker tag ${IMAGE_NAME}:latest coryodaniel/${IMAGE_NAME}:${REL_TIME} && \
	docker push coryodaniel/${IMAGE_NAME}:latest && \
	docker push coryodaniel/${IMAGE_NAME}:${REL_TIME}

shell:
	docker run -it ${IMAGE_NAME}:latest /bin/bash
