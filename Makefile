BINARY_NAME = vaultwarden-backup
ENTRYPOINT = ./main.go
BIN_FOLDER = ./bin
OSes = "linux"
ARCHes = "arm64" "amd64"

# Make all targets silent
.SILENT:

build:
	go build -o $(BIN_FOLDER)/$(BINARY_NAME) $(ENTRYPOINT)

run:
	go run $(ENTRYPOINT) run

clean:
	rm -rf $(BIN_FOLDER)

lint:
	golangci-lint run

compile: clean
	mkdir -p $(BIN_FOLDER)
	for os in $(OSes); do \
		for arch in $(ARCHes); do \
			GOOS=$${os} GOARCH=$${arch} go build -o $(BIN_FOLDER)/$(BINARY_NAME)-$${os}-$${arch} $(ENTRYPOINT);  \
		done \
	done
