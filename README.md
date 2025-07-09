# Terraform Module Template

Este es un template para crear módulos de Terraform siguiendo las mejores prácticas de desarrollo, documentación, seguridad y testing.

## 🚀 Características

- ✅ Estructura estándar de módulo Terraform
- ✅ Documentación automática con terraform-docs
- ✅ Validación y linting con pre-commit hooks
- ✅ Análisis de seguridad con Checkov y TFSec
- ✅ Testing con Terratest
- ✅ CI/CD con GitHub Actions
- ✅ Versionado semántico automático
- ✅ Ejemplos de uso completos

## 📁 Estructura del Proyecto

```
.
├── .github/                    # GitHub Actions workflows
│   ├── workflows/
│   │   ├── ci.yml             # Continuous Integration
│   │   ├── release.yml        # Automated releases
│   │   └── security.yml       # Security scanning
│   ├── ISSUE_TEMPLATE/        # Issue templates
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── dependabot.yml         # Dependency updates
├── .pre-commit-config.yaml    # Pre-commit hooks configuration
├── .terraform-docs.yml        # terraform-docs configuration
├── .tflint.hcl               # TFLint configuration
├── .checkov.yml              # Checkov configuration
├── examples/                  # Usage examples
│   ├── complete/             # Complete example
│   └── simple/               # Simple example
├── test/                     # Tests
│   ├── terraform_test.go     # Terratest tests
│   └── go.mod               # Go module for testing
├── main.tf                   # Main Terraform configuration
├── variables.tf              # Input variables
├── outputs.tf                # Output values
├── versions.tf               # Provider requirements
├── locals.tf                 # Local values (if needed)
├── data.tf                   # Data sources (if needed)
├── README.md                 # Module documentation
├── CHANGELOG.md              # Change log
├── LICENSE                   # License file
└── Makefile                  # Common tasks automation
```

## 🛠️ Uso del Template

### 1. Crear nuevo repositorio desde template

1. Haz clic en "Use this template" en GitHub
2. Crea tu nuevo repositorio
3. Clona el repositorio localmente

### 2. Personalizar el módulo

1. Actualiza `README.md` con la descripción de tu módulo
2. Modifica `main.tf`, `variables.tf` y `outputs.tf` según tu módulo
3. Actualiza los ejemplos en la carpeta `examples/`
4. Configura los tests en `test/`

### 3. Configurar desarrollo local

```bash
# Instalar pre-commit
pip install pre-commit
pre-commit install

# Instalar herramientas de desarrollo (macOS)
brew install terraform tflint terraform-docs checkov tfsec

# Ejecutar validaciones
make validate
make security
make docs
```

## 📋 Comandos Disponibles

```bash
# Formatear código
make fmt

# Validar configuración
make validate

# Ejecutar linting
make lint

# Análisis de seguridad
make security

# Generar documentación
make docs

# Ejecutar tests
make test

# Limpieza
make clean

# Ejecutar todas las validaciones
make all
```

## 🔒 Seguridad

Este template incluye múltiples herramientas de seguridad:

- **Checkov**: Análisis estático de seguridad
- **TFSec**: Scanner de seguridad específico para Terraform
- **Dependabot**: Actualizaciones automáticas de dependencias
- **CODEOWNERS**: Control de revisiones de código

## 📝 Contribuir

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está licenciado bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

## 🤝 Soporte

Si encuentras algún problema o tienes alguna pregunta, por favor abre un [issue](../../issues).
