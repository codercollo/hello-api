GO_VERSION := 1.18

.PHONY: install-go init-go setup build

setup: install-go init-go
	@echo "Go $(GO_VERSION) installed and environment initialized."

install-go:
	wget "https://golang.org/dl/go$(GO_VERSION).linux-amd64.tar.gz"
	sudo rm -rf /usr/local/go
	sudo tar -C /usr/local -xzf go$(GO_VERSION).linux-amd64.tar.gz
	rm go$(GO_VERSION).linux-amd64.tar.gz

init-go:
	echo 'export PATH=$$PATH:/usr/local/go/bin' >> $${HOME}/.bashrc
	echo 'export PATH=$$PATH:$${HOME}/go/bin' >> $${HOME}/.bashrc
	@echo "PATH updated. Run 'source ~/.bashrc' to apply changes."

build:
	@echo "Building the application..."
	go build -o api ./
	@echo "Build complete. Output: ./api"

