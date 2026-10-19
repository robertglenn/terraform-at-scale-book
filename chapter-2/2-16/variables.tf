
variable "special_s3_type" {
  description = "controls how the dependent_s3_bucket is validated"
  type        = bool
  default     = false
}

variable "dependent_s3_bucket" {
  description = "has validation constraints based on another variable"
  type        = string

  # the bucket should start with “spc-” or with “crp-”, depending on the
  # Boolean special_s3_type variable
  validation {
    condition = (var.special_s3_type ?
      (startswith(var.dependent_s3_bucket, "spc-"))
    : (startswith(var.dependent_s3_bucket, "crp-")))
    error_message = join(" ", [
      "since special_s3_type is ${var.special_s3_type}, dependent_s3_bucket must",
      "begin with \"${var.special_s3_type ? "spc-" : "crp-"}\""
    ])
  }
}
