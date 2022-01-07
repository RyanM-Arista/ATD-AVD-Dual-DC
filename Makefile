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

.PHONY: fabric-provision
fabric-build: ## Run ansible playbook to build EVPN Fabric configuration for ATD Fabric and CV (will provision/create tasks on CVP for Change Control procedures)
	ansible-playbook playbooks/fabric-deploy.yml --tags provision -i inventory.yml

.PHONY: fabric-validate
fabric-validate: ## Run ansible playbook to validate EVPN Fabric configuration for ATD Fabric and eAPI
	ansible-playbook playbooks/fabric-validate-state.yml -i inventory.yml

.PHONY: fabric-backup
fabric-backup: ## Run ansible playbook to backup switch fabric via eAPI
	ansible-playbook playbooks/fabric-backup.yml -i inventory.yml

.PHONY: build-debug
build-debug: ## Run ansible playbook to build Fabric configuration for AVD Fabric and CVP with debugging enabled
	ansible-playbook playbooks/fabric-deploy.yml --tags build,debug -i inventory.yml