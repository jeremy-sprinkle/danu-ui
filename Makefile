NAMESPACE		= danu/danu-ui
GITHASH 		?= $(shell git rev-parse HEAD)
DATE			= $(shell date -u +%Y%m%d_%H%M%S)
VERSION 		?= 0.0.${CI_PIPELINE_ID}
NAME			= danu-ui

build:
	CGO_ENABLED=0 go build -ldflags "-s -X $(NAMESPACE)/pkg/version.Version=$(VERSION) -X $(NAMESPACE)/pkg/version.Hash=$(GITHASH) -X $(NAMESPACE)/pkg/version.BuiltDate=$(DATE)" -o ./dist/${NAME} $(NAMESPACE)/cmd/

lint:
	gofmt -l .

