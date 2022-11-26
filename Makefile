UBUNTU_VERSION?=18.04
TOOL?=hotspotdrivenframework
DOCKER_IMAGE?=ubuntu:$(UBUNTU_VERSION)-$(TOOL)
DOCKER_FILE?=Dockerfile-ubuntu-$(UBUNTU_VERSION)
ZIPS=.tar.gz
ARCH=$(shell uname -m)
ifeq ($(ARCH), aarch64)
	DYNAMORIO_GIT_RELEASE?="https://github.com/DynamoRIO/dynamorio/releases/download/release_9.0.1/DynamoRIO-AArch64-Linux-9.0.1.tar.gz"
	DYNAMORIO_DIR?=DynamoRIO-AArch64-Linux-9.0.1
else ifeq ($(ARCH), x86_64)
	DYNAMORIO_GIT_RELEASE?="https://github.com/DynamoRIO/dynamorio/releases/download/release_9.0.1/DynamoRIO-Linux-9.0.1.tar.gz"
	DYNAMORIO_DIR?="DynamoRIO-Linux-9.0.1"
else
        $(error Unsupported architecture!)
endif

run:
	docker run --privileged=true  --rm -it -v "${PWD}:${PWD}" --user $(shell id -u):$(shell id -g) -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro  -w "${PWD}" $(DOCKER_IMAGE)

tools:
	@if [ ! -d "DynamoRIO" ]; then \
		$(info Downloading DynamoRIO) \
		wget  $(DYNAMORIO_GIT_RELEASE); \
		tar -zxf  $(DYNAMORIO_DIR)$(ZIPS); \
		mv  $(DYNAMORIO_DIR) DynamoRIO ; \
		echo $(DYNAMORIO_DIR)$(ZIPS); \
	fi



build: $(DOCKER_FILE).build

# Use a .PHONY target to build all of the docker images if requested
Dockerfile%.build: Dockerfile%
	docker build  $(DOCKER_BUILD_OPT) -f $(<) -t ubuntu:$(subst Dockerfile-ubuntu-,,$(<))-$(TOOL) .


clean:
	rm -rf $(DYNAMORIO_DIR)$(ZIPS)

distclean: clean
	rm -rf DynamoRIO 

.PHONY: build  run tools clean distclean
