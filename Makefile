
APP=$(shell basename $(shell git remote get-url origin))
REGESTRY=europe-west3-docker.pkg.dev/heroic-bird-417808/week4
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
# TARGETOS ?= $(word 1, $(MAKECMDGOALS))
TARGETOS=linux
TARGETARCH ?= $(if $(word 2, $(MAKECMDGOALS)),$(word 2, $(MAKECMDGOALS)),amd64) #amd64
# IMAGES=$(shell docker images --filter=reference="${REGESTRY}/${APP}:${VERSION}*" -q)


empty_params:
	$(error Please run 'make <OS> [arch]' to build binary for required OS and architecture. Default architecture is amd64)


linux: TARGETOS=linux
linux: image push
windows: TARGETOS=windows
windows: image push
MacOs: TARGETOS=MacOs
MacOs: image push

# $(TARGETOS): image
# # 	@echo OS is $(TARGETOS)

$(TARGETARCH):
	@echo Do nothing


format:
	cd src; gofmt -s -w ./

get_all:
	cd src; go get

build: format get_all
	cd src; CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o ../webserv -ldflags "-X="github.com/bu4man/task4_4/cmd.appVersion=${VERSION}

image:
	docker buildx build . -t ${REGESTRY}/${APP}:${VERSION}-$(TARGETOS)-${TARGETARCH} --platform=${TARGETOS}/${TARGETARCH} # --build-arg TARGETOS=$(TARGETOS) --build-arg TARGETARCH=$(TARGETARCH)

push:
	docker push ${REGESTRY}/${APP}:${VERSION}-$(TARGETOS)-${TARGETARCH} 

lint:
	golint

test:
	go test -v

clean:
	rm -rf ./webserv
	docker rmi ${REGESTRY}/${APP}:${VERSION}-$(TARGETOS)-${TARGETARCH} 
