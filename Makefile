.PHONY: help fmt validate lint security docs test clean all
.DEFAULT_GOAL := help

## Variables
TERRAFORM_VERSION := 1.5.0
TFLINT_VERSION := 0.47.0
TERRAFORM_DOCS_VERSION := 0.16.0
CHECKOV_VERSION := 2.3.0

## Colors
COLOR_RESET = \033[0m
COLOR_BOLD = \033[1m
COLOR_GREEN = \033[32m
COLOR_YELLOW = \033[33m
COLOR_RED = \033[31m
COLOR_BLUE = \033[34m

help: ## Mostrar ayuda
	@echo "$(COLOR_BOLD)Comandos disponibles:$(COLOR_RESET)"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  $(COLOR_BLUE)%-15s$(COLOR_RESET) %s\n", $$1, $$2}' $(MAKEFILE_LIST)

fmt: ## Formatear código Terraform
	@echo "$(COLOR_YELLOW)🔧 Formateando código Terraform...$(COLOR_RESET)"
	@terraform fmt -recursive
	@echo "$(COLOR_GREEN)✅ Código formateado$(COLOR_RESET)"

validate: ## Validar configuración Terraform
	@echo "$(COLOR_YELLOW)🔍 Validando configuración Terraform...$(COLOR_RESET)"
	@terraform init -backend=false
	@terraform validate
	@echo "$(COLOR_GREEN)✅ Configuración válida$(COLOR_RESET)"

lint: ## Ejecutar linting con TFLint
	@echo "$(COLOR_YELLOW)🔍 Ejecutando TFLint...$(COLOR_RESET)"
	@tflint --init
	@tflint
	@echo "$(COLOR_GREEN)✅ Linting completado$(COLOR_RESET)"

security: ## Análisis de seguridad con Checkov y TFSec
	@echo "$(COLOR_YELLOW)🔒 Ejecutando análisis de seguridad...$(COLOR_RESET)"
	@echo "$(COLOR_BLUE)Ejecutando Checkov...$(COLOR_RESET)"
	@checkov -d . --framework terraform --quiet
	@echo "$(COLOR_BLUE)Ejecutando TFSec...$(COLOR_RESET)"
	@tfsec .
	@echo "$(COLOR_GREEN)✅ Análisis de seguridad completado$(COLOR_RESET)"

docs: ## Generar documentación con terraform-docs
	@echo "$(COLOR_YELLOW)📚 Generando documentación...$(COLOR_RESET)"
	@terraform-docs markdown table --output-file README.md --output-mode inject .
	@echo "$(COLOR_GREEN)✅ Documentación generada$(COLOR_RESET)"

test: ## Ejecutar tests con Terratest
	@echo "$(COLOR_YELLOW)🧪 Ejecutando tests...$(COLOR_RESET)"
	@cd test && go test -v -timeout 30m
	@echo "$(COLOR_GREEN)✅ Tests completados$(COLOR_RESET)"

clean: ## Limpiar archivos temporales
	@echo "$(COLOR_YELLOW)🧹 Limpiando archivos temporales...$(COLOR_RESET)"
	@rm -rf .terraform/
	@rm -f .terraform.lock.hcl
	@rm -f terraform.tfstate*
	@rm -f .tflint.hcl.bak
	@find . -name "*.tfplan" -delete
	@find . -name ".terraform" -type d -exec rm -rf {} + 2>/dev/null || true
	@echo "$(COLOR_GREEN)✅ Limpieza completada$(COLOR_RESET)"

install-tools: ## Instalar herramientas de desarrollo (macOS)
	@echo "$(COLOR_YELLOW)📦 Instalando herramientas de desarrollo...$(COLOR_RESET)"
	@brew install terraform tflint terraform-docs checkov tfsec pre-commit
	@echo "$(COLOR_GREEN)✅ Herramientas instaladas$(COLOR_RESET)"

setup: ## Configurar entorno de desarrollo
	@echo "$(COLOR_YELLOW)⚙️  Configurando entorno de desarrollo...$(COLOR_RESET)"
	@pre-commit install
	@pre-commit install --hook-type commit-msg
	@echo "$(COLOR_GREEN)✅ Entorno configurado$(COLOR_RESET)"

check-tools: ## Verificar que las herramientas estén instaladas
	@echo "$(COLOR_YELLOW)🔍 Verificando herramientas...$(COLOR_RESET)"
	@command -v terraform >/dev/null 2>&1 || (echo "$(COLOR_RED)❌ Terraform no está instalado$(COLOR_RESET)" && exit 1)
	@command -v tflint >/dev/null 2>&1 || (echo "$(COLOR_RED)❌ TFLint no está instalado$(COLOR_RESET)" && exit 1)
	@command -v terraform-docs >/dev/null 2>&1 || (echo "$(COLOR_RED)❌ terraform-docs no está instalado$(COLOR_RESET)" && exit 1)
	@command -v checkov >/dev/null 2>&1 || (echo "$(COLOR_RED)❌ Checkov no está instalado$(COLOR_RESET)" && exit 1)
	@command -v tfsec >/dev/null 2>&1 || (echo "$(COLOR_RED)❌ TFSec no está instalado$(COLOR_RESET)" && exit 1)
	@echo "$(COLOR_GREEN)✅ Todas las herramientas están disponibles$(COLOR_RESET)"

all: fmt validate lint security docs ## Ejecutar todas las validaciones
	@echo "$(COLOR_GREEN)🎉 Todas las validaciones completadas exitosamente$(COLOR_RESET)"
