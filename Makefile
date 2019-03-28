# Docker specific options
BASE ?= debian
NAME ?= perl6
TAG ?= latest

# Build options
MOAR_BRANCH ?= master
MOAR_REPO ?= https://github.com/moarvm/moarvm.git
NQP_BRANCH ?= master
NQP_REPO ?= https://github.com/perl6/nqp.git
RAKUDO_BRANCH ?= master
RAKUDO_REPO ?= https://github.com/rakudo/rakudo.git
RAKUDO_VERSION ?= 2019.03.1

docker-repo:
	docker build \
		--build-arg "RELEASE=0" \
		--build-arg "MOAR_BRANCH=$(MOAR_BRANCH)" \
		--build-arg "MOAR_REPO=$(MOAR_REPO)" \
		--build-arg "NQP_BRANCH=$(NQP_BRANCH)" \
		--build-arg "NQP_REPO=$(NQP_REPO)" \
		--build-arg "RAKUDO_BRANCH=$(RAKUDO_BRANCH)" \
		--build-arg "RAKUDO_REPO=$(RAKUDO_REPO)" \
		--no-cache \
		-t $(USER)/$(NAME):$(TAG) \
		-f docker/$(BASE) \
		.

docker-release:
	docker build \
		--build-arg "RELEASE=1" \
		--build-arg "RAKUDO_VERSION=$(RAKUDO_VERSION)" \
		--no-cache \
		-t $(USER)/$(NAME):$(RAKUDO_VERSION) \
		-f docker/$(BASE) \
		.

.PHONY: docker-repo docker-release
