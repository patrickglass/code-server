CODE_SERVER_VERSION?=latest

default: build

.PHONY: build
build:
	docker build . \
		--build-arg CODE_SERVER_VERSION=$(CODE_SERVER_VERSION) \
		--tag patrickglass/code-server:$(CODE_SERVER_VERSION)

.PHONY: push
push: build
	docker push patrickglass/code-server --all-tags
