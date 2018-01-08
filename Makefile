# This should match the FROM line in Dockerfile:
UBUNTU := xenial

# These override the ARG lines in Dockerfile:
QT:= 5.10.0
QTM := 5.10
QTSHA := fd1e0b06c33f89ae4cd971f5cfe1885fbff3f02955c55e556bdcc079f85a9673
VCS_REF := $(shell git rev-parse --short HEAD)
BUILD_DATE := $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")

# If you need to change anything below, please raise an issue:
TAG := qt-build:$(UBUNTU)-$(QT)-2

.PHONY: image

image: $(QTF)
	docker build --build-arg "QT=$(QT)" --build-arg "QTM=$(QTM)" --build-arg "QTSHA=$(QTSHA)" --build-arg "VCS_REF=$(VCS_REF)" --build-arg "BUILD_DATE=$(BUILD_DATE)" --tag "$(TAG)" .
