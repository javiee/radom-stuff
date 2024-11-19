# Makefile for Ansible roles with selectable inventories

# Variables
ANSIBLE_PLAYBOOK := ansible-playbook
INVENTORY ?= inventories/production/hosts # Default inventory file
ANSIBLE_LINT := ansible-lint

# Targets
.PHONY: all base webserver lint clean

all: base webserver lint

base:
	@echo "Running ansible-playbook for 'base' role with inventory: $(INVENTORY)..."
	$(ANSIBLE_PLAYBOOK) base.yml -i $(INVENTORY) 

promtail:
	@echo "Running ansible-playbook for 'base' role with inventory: $(INVENTORY)..."
	$(ANSIBLE_PLAYBOOK) base.yml -i $(INVENTORY) --tags promtail

users:
	@echo "Running ansible-playbook for 'base' role with inventory: $(INVENTORY)..."
	$(ANSIBLE_PLAYBOOK) base.yml -i $(INVENTORY)  --tags users

webserver:
	@echo "Running ansible-playbook for 'webserver' role with inventory: $(INVENTORY)..."
	$(ANSIBLE_PLAYBOOK) webserver.yml -i $(INVENTORY)

lint:
	@echo "Running ansible-lint for playbooks and roles..."
	$(ANSIBLE_LINT) *.yml roles/*

clean:
	@echo "Cleaning up temporary files..."
	@find . -name "*.retry" -delete

# Help target to display usage
help:
	@echo "Usage: make <target> [INVENTORY=<inventory_file>]"
	@echo "Targets:"
	@echo "  all         Run both base and webserver playbooks and ansible-lint."
	@echo "  base        Run the base playbook with the selected inventory."
	@echo "  webserver   Run the webserver playbook with the selected inventory."
	@echo "  promtail    Run the base playbook and execute only promtail tasks."
	@echo "  users       Run the base playbook and execute only users tasks."
	@echo "  lint        Run ansible-lint on all playbooks and roles."
	@echo "  clean       Remove any temporary files."
	@echo "  help        Show this help message."
	@echo ""
	@echo "Default inventory: inventories/staging/hosts "
	@echo "To use a different inventory, specify INVENTORY=inventories/development/hosts (or another file) in the command."
