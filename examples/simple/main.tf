module "simple_example" {
  source = "../../"

  name        = var.project_name
  environment = var.environment

  additional_tags = {
    Example = "Simple"
    Owner   = "DevOps Team"
  }
}
