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

docker:
	docker build \
		--build-arg "MOAR_BRANCH=$(MOAR_BRANCH)" \
		--build-arg "MOAR_REPO=$(MOAR_REPO)" \
		--build-arg "NQP_BRANCH=$(NQP_BRANCH)" \
		--build-arg "NQP_REPO=$(NQP_REPO)" \
		--build-arg "RAKUDO_BRANCH=$(RAKUDO_BRANCH)" \
		--build-arg "RAKUDO_REPO=$(RAKUDO_REPO)" \
		-t $(USER)/$(NAME):$(TAG) \
		-f docker/$(BASE) \
		.

.PHONY: docker
