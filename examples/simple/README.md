# Ejemplo Simple

Este ejemplo muestra el uso básico del módulo con la configuración mínima requerida.

## Uso

Para ejecutar este ejemplo necesitas tener Terraform instalado:

```bash
# Inicializar Terraform
terraform init

# Planificar los cambios
terraform plan

# Aplicar los cambios
terraform apply

# Destruir los recursos (cuando termines)
terraform destroy
```

## Configuración

Este ejemplo crea:

- Un bucket S3 con configuración básica de seguridad
- Tags estándar aplicadas automáticamente
- Configuración de encriptación habilitada por defecto

## Variables

Puedes personalizar el ejemplo modificando las variables en `variables.tf` o pasándolas como argumentos:

```bash
terraform apply -var="project_name=mi-proyecto" -var="environment=staging"
```
