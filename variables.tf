variable "name" {
  description = "Nombre base para los recursos"
  type        = string
  
  validation {
    condition     = length(var.name) > 0 && length(var.name) <= 50
    error_message = "El nombre debe tener entre 1 y 50 caracteres."
  }
}

variable "environment" {
  description = "Nombre del entorno (dev, staging, prod)"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "El entorno debe ser uno de: dev, staging, prod."
  }
}

variable "additional_tags" {
  description = "Tags adicionales para aplicar a todos los recursos"
  type        = map(string)
  default     = {}
}

variable "enable_monitoring" {
  description = "Habilitar monitoreo para los recursos"
  type        = bool
  default     = false
}

variable "enable_encryption" {
  description = "Habilitar encriptación para los recursos"
  type        = bool
  default     = true
}
