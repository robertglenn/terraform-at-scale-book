
variable "special_s3_type" {
  description = "controls how the dependent_s3_bucket is validated"
  type        = bool
  default     = false
}

variable "dependent_s3_bucket" {
  description = "has validation constraints based on another variable"
  type        = string

  validation {
    condition = (var.special_s3_type ?
      (startswith(var.dependent_s3_bucket, "spc-"))
    : (startswith(var.dependent_s3_bucket, "crp-")))
    error_message = <<-EOT
      The bucket should start with 'spc-' or with 'crp-', depending on the 
      special_s3_type variable
    EOT
  }
}
