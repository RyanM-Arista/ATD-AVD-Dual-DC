### Generic Variables
SHELL := /bin/zsh

.PHONY: help
help: ## Display help message (*: main entry points / []: part of an entry point)
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


################################################################################
# ATD-fabric
################################################################################

.PHONY: fabric-build
fabric-build: ## Run ansible playbook to build Fabric configuration for ATD Fabric and CVP (will build configuration locally on your VS Code Instance)
	ansible-playbook playbooks/fabric-deploy.yml --tags build -i inventory.yml