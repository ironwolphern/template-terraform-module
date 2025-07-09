module "complete_example" {
  source = "../../"

  name        = var.project_name
  environment = var.environment

  # Habilitar todas las características
  enable_monitoring = true
  enable_encryption = true

  additional_tags = {
    Example    = "Complete"
    Owner      = var.team_name
    CostCenter = var.cost_center
    Backup     = "Daily"
    Compliance = "SOC2"
  }
}
