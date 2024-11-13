#------------------------------------------------------------------------------
# Variables for the module (Input Variables)
#------------------------------------------------------------------------------
variable "input_var" {
  type        = string # string, number, bool, list, map, set, object, tuple, any
  description = "Description of the input variable."
  default     = "value"
  nullable    = false
  validation {
    condition     = length(var.input_var) > 0
    error_message = "error message"
  }
}
