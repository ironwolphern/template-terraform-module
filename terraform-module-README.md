# Example Terraform Module

[![Terraform](https://img.shields.io/badge/terraform-~%3E1.0-blue)](https://www.terraform.io/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Pre-Commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

Un módulo de Terraform para [describir qué hace tu módulo].

## Uso

### Ejemplo Simple

```hcl
module "example" {
  source = "github.com/tu-usuario/tu-modulo-terraform"

  name                = "mi-recurso"
  environment         = "production"
  additional_tags     = {
    Owner = "DevOps Team"
  }
}
```

### Ejemplo Completo

```hcl
module "example_complete" {
  source = "github.com/tu-usuario/tu-modulo-terraform"

  name                = "mi-recurso-completo"
  environment         = "production"
  
  # Configuración avanzada
  enable_monitoring   = true
  enable_encryption   = true
  
  # Tags
  additional_tags = {
    Owner       = "DevOps Team"
    Project     = "Infrastructure"
    Environment = "production"
  }
}
```

## Ejemplos

- [Ejemplo Simple](./examples/simple) - Configuración básica
- [Ejemplo Completo](./examples/complete) - Configuración con todas las opciones

## Requisitos

| Nombre | Versión |
|--------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Proveedores

| Nombre | Versión |
|--------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Módulos

No se utilizan módulos externos.

## Recursos

| Nombre | Tipo |
|--------|------|
| [aws_example_resource.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/example_resource) | resource |

## Entradas

| Nombre | Descripción | Tipo | Por Defecto | Requerido |
|--------|-------------|------|-------------|:---------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | Tags adicionales para aplicar a todos los recursos | `map(string)` | `{}` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Nombre del entorno (dev, staging, prod) | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Nombre base para los recursos | `string` | n/a | yes |

## Salidas

| Nombre | Descripción |
|--------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID del recurso creado |
| <a name="output_arn"></a> [arn](#output\_arn) | ARN del recurso creado |

## Contribuir

Las contribuciones son bienvenidas. Por favor, lee [CONTRIBUTING.md](CONTRIBUTING.md) para más detalles sobre el proceso de contribución.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.
