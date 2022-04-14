.DEFAULT_GOAL:=help
SHELL:=/bin/bash

.PHONY: help notebook

init: ## Initialize conda
	conda init zsh
	$(info Restart your shell after running this)

activate: ## Activate the conda environment
	conda activate

notebook: ## Spin up the notebook
	jupyter notebook --ip='*' --port=8888 --no-browser

help: ## Display this help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
