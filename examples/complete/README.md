# Ejemplo Completo

Este ejemplo muestra el uso avanzado del módulo con todas las características habilitadas.

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

- Un bucket S3 con configuración completa de seguridad
- Encriptación habilitada
- Monitoreo con CloudWatch habilitado
- Versionado habilitado
- Bloqueo de acceso público
- Tags completas para governance

## Características Habilitadas

- ✅ Encriptación server-side
- ✅ Versionado de objetos
- ✅ Bloqueo de acceso público
- ✅ Monitoreo con CloudWatch
- ✅ Tags completas para governance

## Variables

Este ejemplo incluye variables adicionales para demostrar un caso de uso en producción:

- `team_name`: Equipo responsable del recurso
- `cost_center`: Centro de costos para facturación
- `environment`: Entorno de producción

## Salidas

El ejemplo expone todas las salidas disponibles del módulo, incluyendo:

- IDs de recursos
- ARNs
- Nombres de dominio
- Tags aplicadas
