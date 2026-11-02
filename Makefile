.PHONY: help init plan apply destroy validate fmt lint security

SHELL := /bin/bash
ENV ?= dev

help:
	@echo "Enterprise Cloud IaC Management"
	@echo "Usage: make <target> ENV=<dev|uat|prod>"
	@echo ""
	@echo "Targets:"
	@echo "  fmt         Format all Terraform files"
	@echo "  validate    Validate Terraform syntax across environments"
	@echo "  lint        Run tflint"
	@echo "  security    Run tfsec and checkov static analysis"
	@echo "  init        Initialize environment (ENV=dev/uat/prod)"
	@echo "  plan        Generate execution plan (ENV=dev/uat/prod)"
	@echo "  apply       Apply execution plan (ENV=dev/uat/prod)"
	@echo "  destroy     Tear down infrastructure (ENV=dev/uat/prod)"

fmt:
	terraform fmt -recursive

validate:
	@for d in environments/dev environments/uat environments/prod; do \
		echo "Validating $$d..."; \
		(cd $$d && terraform init -backend=false && terraform validate) || exit 1; \
	done

lint:
	tflint --recursive

security:
	@which tfsec > /dev/null && tfsec . || echo "tfsec not found, skipping"
	@which checkov > /dev/null && checkov -d . --framework terraform || echo "checkov not found, skipping"

init:
	@echo "Initializing $(ENV)..."
	cd environments/$(ENV) && terraform init

plan:
	@echo "Planning $(ENV)..."
	cd environments/$(ENV) && terraform plan -out=tfplan

apply:
	@echo "Applying $(ENV)..."
	cd environments/$(ENV) && terraform apply tfplan

destroy:
	@echo "Destroying $(ENV)..."
	cd environments/$(ENV) && terraform destroy

