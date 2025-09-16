
variable "set_by_default" {
  description = "This is set by default"
  type        = string
  default     = "default-string-value"
}

variable "set_in_tfvars" {
  description = "This is set in tfvars"
  type        = string
}

variable "set_on_cli" {
  description = "This is set on the command line with the -var flag"
  type        = string
}
