# 🚀 Instrucciones de Uso del Template

## Paso 1: Crear Repositorio desde Template

1. Haz clic en el botón "Use this template" en GitHub
2. Nombra tu nuevo repositorio siguiendo la convención: `terraform-[provider]-[resource]`
   - Ejemplo: `terraform-aws-s3-bucket`
   - Ejemplo: `terraform-azure-resource-group`

## Paso 2: Clonar y Configurar

```bash
# Clonar el repositorio
git clone https://github.com/tu-usuario/tu-nuevo-modulo.git
cd tu-nuevo-modulo

# Configurar herramientas de desarrollo
make install-tools  # Solo en macOS
make setup
```

## Paso 3: Personalizar el Módulo

### 3.1 Actualizar archivos de configuración

1. **README.md**: Actualiza la descripción del módulo
2. **main.tf**: Reemplaza el recurso de ejemplo con tus recursos
3. **variables.tf**: Define las variables de entrada de tu módulo
4. **outputs.tf**: Define las salidas de tu módulo
5. **versions.tf**: Actualiza los providers necesarios

### 3.2 Actualizar ejemplos

1. **examples/simple/**: Crea un ejemplo básico
2. **examples/complete/**: Crea un ejemplo con todas las características

### 3.3 Actualizar tests

1. **test/terraform_test.go**: Adapta los tests a tu módulo

## Paso 4: Configurar GitHub

### 4.1 Secretos del repositorio

Ve a Settings > Secrets and variables > Actions y agrega:

```
AWS_ACCESS_KEY_ID=tu-access-key
AWS_SECRET_ACCESS_KEY=tu-secret-key
```

### 4.2 Configurar branch protection

1. Ve a Settings > Branches
2. Agrega regla para `main`
3. Habilita:
   - Require pull request reviews
   - Require status checks to pass
   - Require branches to be up to date

### 4.3 Habilitar GitHub Advanced Security

1. Ve a Settings > Security & analysis
2. Habilita:
   - Dependency graph
   - Dependabot alerts
   - Dependabot security updates
   - Code scanning

## Paso 5: Personalizar Archivos

### 5.1 Buscar y reemplazar

Busca y reemplaza los siguientes placeholders:

- `tu-usuario` → tu usuario de GitHub
- `tu-modulo-terraform` → nombre de tu módulo
- `tu-organizacion.com` → tu dominio
- `DevOps Team` → tu equipo
- `security@tu-organizacion.com` → tu email de seguridad

### 5.2 Actualizar CODEOWNERS

Actualiza `.github/CODEOWNERS` con los usuarios/equipos correctos:

```
* @tu-equipo
*.tf @tu-equipo @terraform-team
```

## Paso 6: Primer Release

### 6.1 Commit inicial

```bash
git add .
git commit -m "feat: initial module implementation"
git push origin main
```

### 6.2 Crear primer tag

```bash
git tag v1.0.0
git push origin v1.0.0
```

## Paso 7: Validar Setup

```bash
# Ejecutar todas las validaciones
make all

# Ejecutar tests
make test

# Generar documentación
make docs
```

## 🔧 Comandos Útiles

```bash
# Desarrollo
make fmt          # Formatear código
make validate     # Validar Terraform
make lint         # Ejecutar linting
make security     # Análisis de seguridad
make docs         # Generar documentación
make test         # Ejecutar tests
make all          # Todas las validaciones

# Limpieza
make clean        # Limpiar archivos temporales
```

## 📋 Checklist de Finalización

- [ ] Repositorio creado desde template
- [ ] Herramientas instaladas y configuradas
- [ ] Archivos personalizados (README, main.tf, etc.)
- [ ] Ejemplos actualizados
- [ ] Tests adaptados
- [ ] Secretos de GitHub configurados
- [ ] Branch protection habilitado
- [ ] CODEOWNERS actualizado
- [ ] Primer commit y tag creados
- [ ] Todas las validaciones pasan
- [ ] CI/CD funcionando correctamente

## 🆘 Solución de Problemas

### Error en pre-commit hooks

```bash
# Reinstalar hooks
pre-commit uninstall
pre-commit install
```

### Error en tests

```bash
# Verificar credenciales AWS
aws sts get-caller-identity

# Ejecutar tests individuales
cd test && go test -run TestTerraformSimpleExample -v
```

### Error en herramientas

```bash
# Verificar instalación
make check-tools

# Reinstalar herramientas
make install-tools
```

¡Tu template está lista para usar! 🎉
