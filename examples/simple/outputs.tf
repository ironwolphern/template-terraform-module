output "bucket_id" {
  description = "ID del bucket S3 creado"
  value       = module.simple_example.bucket_id
}

output "bucket_arn" {
  description = "ARN del bucket S3 creado"
  value       = module.simple_example.bucket_arn
}
