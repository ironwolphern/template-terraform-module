locals {
  # Tags comunes para todos los recursos
  common_tags = merge(
    {
      Name        = var.name
      Environment = var.environment
      ManagedBy   = "Terraform"
      Module      = "terraform-module-template"
    },
    var.additional_tags
  )

  # Nombre con prefijo del entorno
  name_prefix = "${var.environment}-${var.name}"
}
