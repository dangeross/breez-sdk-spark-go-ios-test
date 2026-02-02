.PHONY: setup framework

GOPATH := $(shell go env GOPATH)
GOMOBILE := $(GOPATH)/bin/gomobile
GOMODCACHE := $(shell go env GOMODCACHE)
GOBIND_DIR := gobind
XCFRAMEWORK := BreezSparkTest/Gobind.xcframework

setup:
	go install golang.org/x/mobile/cmd/gomobile@latest
	go install golang.org/x/mobile/cmd/gobind@latest
	$(GOMOBILE) init

framework: setup gobind-xcframework

gobind-xcframework:
	cd $(GOBIND_DIR) && \
	PATH="$(GOPATH)/bin:$$PATH" \
	GONOSUMCHECK='*' GONOSUMDB='*' GOPROXY=direct \
	$(GOMOBILE) bind \
		-target=ios/arm64,iossimulator/amd64 \
		-o ../$(XCFRAMEWORK) \
		.
