# This should match the FROM line in Dockerfile:
UBUNTU := xenial

# These override the ARG lines in Dockerfile:
QT:= 5.9.3
QTM := 5.9
QTSHA := 4df4f8e6ccd61f9aa038ad4a6e688412a95de78f8607c4132b8277f05aac24b8
VCS_REF := $(shell git rev-parse --short HEAD)
BUILD_DATE := $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")

# If you need to change anything below, please raise an issue:
TAG := qt-build:$(UBUNTU)-$(QT)-2

.PHONY: image

image: $(QTF)
	docker build --build-arg "QT=$(QT)" --build-arg "QTM=$(QTM)" --build-arg "QTSHA=$(QTSHA)" --build-arg "VCS_REF=$(VCS_REF)" --build-arg "BUILD_DATE=$(BUILD_DATE)" --tag "$(TAG)" .
