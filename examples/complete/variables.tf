variable "aws_region" {
  description = "Región de AWS donde crear los recursos"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
  default     = "production"
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "complete-example"
}

variable "team_name" {
  description = "Nombre del equipo responsable"
  type        = string
  default     = "DevOps"
}

variable "cost_center" {
  description = "Centro de costos"
  type        = string
  default     = "IT-Infrastructure"
}
