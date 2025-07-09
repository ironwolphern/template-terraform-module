output "bucket_id" {
  description = "ID del bucket S3 creado"
  value       = module.complete_example.bucket_id
}

output "bucket_arn" {
  description = "ARN del bucket S3 creado"
  value       = module.complete_example.bucket_arn
}

output "bucket_domain_name" {
  description = "Nombre de dominio del bucket S3"
  value       = module.complete_example.bucket_domain_name
}

output "bucket_regional_domain_name" {
  description = "Nombre de dominio regional del bucket S3"
  value       = module.complete_example.bucket_regional_domain_name
}

output "applied_tags" {
  description = "Tags aplicadas a los recursos"
  value       = module.complete_example.tags
}
