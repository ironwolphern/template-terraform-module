# Ejemplo de recurso - Reemplaza con tus recursos reales
resource "aws_s3_bucket" "example" {
  bucket = "${local.name_prefix}-bucket"

  tags = local.common_tags
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  count  = var.enable_encryption ? 1 : 0
  bucket = aws_s3_bucket.example.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.example.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

# Recurso condicional para monitoreo
resource "aws_cloudwatch_metric_alarm" "example" {
  count = var.enable_monitoring ? 1 : 0

  alarm_name          = "${local.name_prefix}-bucket-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "BucketSizeBytes"
  namespace           = "AWS/S3"
  period              = "86400"
  statistic           = "Average"
  threshold           = "1000000000" # 1GB in bytes

  dimensions = {
    BucketName  = aws_s3_bucket.example.bucket
    StorageType = "StandardStorage"
  }

  alarm_description = "This metric monitors S3 bucket size"
  alarm_actions     = []

  tags = local.common_tags
}
