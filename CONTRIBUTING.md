# Guía de Contribución

¡Gracias por tu interés en contribuir a este proyecto! 🎉

## 📋 Tabla de Contenidos

- [Código de Conducta](#código-de-conducta)
- [¿Cómo contribuir?](#cómo-contribuir)
- [Configuración del entorno de desarrollo](#configuración-del-entorno-de-desarrollo)
- [Proceso de desarrollo](#proceso-de-desarrollo)
- [Estándares de codificación](#estándares-de-codificación)
- [Testing](#testing)
- [Documentación](#documentación)
- [Proceso de revisión](#proceso-de-revisión)

## Código de Conducta

Este proyecto adhiere al [Contributor Covenant](https://www.contributor-covenant.org/). Se esperaun comportamiento respetuoso de todos los participantes.

## ¿Cómo contribuir?

### Reportar Bugs

1. Busca en los [issues existentes](../../issues) para ver si ya fue reportado
2. Si no existe, crea un nuevo issue usando el template de bug report
3. Incluye toda la información solicitada en el template

### Solicitar Características

1. Busca en los [issues existentes](../../issues) para evitar duplicados
2. Crea un nuevo issue usando el template de feature request
3. Describe claramente la necesidad y el caso de uso

### Contribuir con Código

1. Fork el repositorio
2. Crea una nueva rama desde `main`
3. Realiza tus cambios siguiendo los estándares del proyecto
4. Agrega o actualiza tests según sea necesario
5. Actualiza la documentación
6. Envía un pull request

## Configuración del entorno de desarrollo

### Requisitos

- **Terraform**: >= 1.0
- **Go**: >= 1.19 (para tests)
- **Pre-commit**: Para hooks de validación
- **Make**: Para automatización de tareas

### Instalación (macOS)

```bash
# Instalar herramientas
brew install terraform tflint terraform-docs checkov tfsec pre-commit go

# Instalar pre-commit hooks
make setup

# Verificar instalación
make check-tools
```

### Instalación (Linux)

```bash
# Terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform

# Otras herramientas
pip install pre-commit checkov
go install github.com/terraform-docs/terraform-docs@latest
go install github.com/terraform-linters/tflint@latest
go install github.com/aquasecurity/tfsec/cmd/tfsec@latest

# Configurar pre-commit
make setup
```

## Proceso de desarrollo

### 1. Configuración inicial

```bash
# Clonar tu fork
git clone https://github.com/tu-usuario/tu-modulo-terraform.git
cd tu-modulo-terraform

# Agregar upstream
git remote add upstream https://github.com/usuario-original/tu-modulo-terraform.git

# Configurar entorno
make setup
```

### 2. Crear una nueva rama

```bash
# Actualizar main
git checkout main
git pull upstream main

# Crear nueva rama
git checkout -b feature/mi-nueva-caracteristica
```

### 3. Desarrollar

```bash
# Realizar cambios
# ...

# Ejecutar validaciones
make all

# Commit con mensaje descriptivo
git commit -m "feat: agregar nueva característica"
```

### 4. Enviar Pull Request

```bash
# Push a tu fork
git push origin feature/mi-nueva-caracteristica

# Crear PR desde GitHub
```

## Estándares de codificación

### Terraform

- Usar `terraform fmt` para formatear código
- Seguir convenciones de nomenclatura:
  - Variables: `snake_case`
  - Recursos: `snake_case`
  - Módulos: `kebab-case`
- Documentar todas las variables y outputs
- Usar validaciones en variables cuando sea apropiado

### Estructura de archivos

```
module/
├── main.tf          # Recursos principales
├── variables.tf     # Variables de entrada
├── outputs.tf       # Valores de salida
├── versions.tf      # Requisitos de providers
├── locals.tf        # Valores locales (si es necesario)
├── data.tf          # Data sources (si es necesario)
└── README.md        # Documentación del módulo
```

### Nomenclatura

- **Variables**: Descriptivas y en snake_case
- **Outputs**: Descriptivos y en snake_case
- **Recursos**: Usar `this` para recursos únicos, nombres descriptivos para múltiples

```hcl
# ✅ Bueno
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

# ✅ Bueno para múltiples recursos
resource "aws_s3_bucket" "logs" {
  bucket = "${var.name}-logs"
}

resource "aws_s3_bucket" "data" {
  bucket = "${var.name}-data"
}
```

## Testing

### Tests automáticos

```bash
# Ejecutar todos los tests
make test

# Ejecutar tests específicos
cd test && go test -run TestTerraformSimpleExample
```

### Tests manuales

```bash
# Validar ejemplos
cd examples/simple
terraform init
terraform plan
terraform apply
terraform destroy
```

### Cobertura de tests

Los tests deben cubrir:
- ✅ Validación de configuración
- ✅ Creación exitosa de recursos
- ✅ Configuraciones de seguridad
- ✅ Outputs correctos
- ✅ Limpieza de recursos

## Documentación

### README principal

- Mantener actualizado con terraform-docs
- Incluir ejemplos de uso
- Documentar requisitos y limitaciones

### Generación automática

```bash
# Generar documentación
make docs
```

### Changelog

- Seguir formato [Keep a Changelog](https://keepachangelog.com/)
- Actualizar con cada cambio significativo
- Usar versionado semántico

## Proceso de revisión

### Criterios de aceptación

- [ ] Tests pasan
- [ ] Código formateado correctamente
- [ ] Documentación actualizada
- [ ] Changelog actualizado (si aplica)
- [ ] Sin vulnerabilidades de seguridad
- [ ] Ejemplos funcionan correctamente

### Revisión de código

1. **Funcionalidad**: ¿El código hace lo que se supone?
2. **Calidad**: ¿Sigue las mejores prácticas?
3. **Seguridad**: ¿No introduce vulnerabilidades?
4. **Rendimiento**: ¿Es eficiente?
5. **Mantenibilidad**: ¿Es fácil de entender y modificar?

### Proceso de merge

1. Revisión por al menos un mantenedor
2. Todos los checks de CI pasan
3. Merge con squash commit (para mantener historia limpia)
4. Tag de versión si es un release

## 🆘 ¿Necesitas ayuda?

- 💬 [Discusiones](../../discussions) para preguntas generales
- 🐛 [Issues](../../issues) para reportar problemas
- 📧 Email a [correo@ejemplo.com] untuk soporte directo

## 🎯 Roadmap

Consulta nuestro [roadmap público](../../projects) para ver las características planeadas.

¡Gracias por contribuir! 🚀
