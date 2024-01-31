#------------------------------------------------------------------------------
# Variables for the module (Input Variables)
#------------------------------------------------------------------------------
variable "input_var" {
  description = "Description of the input variable."
  type        = string # string, number, bool, list, map, set, object, tuple, any
  default     = "value"
  nullable    = false
  validation {
    condition     = length(var.input_var) > 0
    error_message = "error message"
  }
}
