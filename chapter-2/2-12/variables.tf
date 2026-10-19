
variable "s3_bucket" {
  description = "validation encodes CSP constraints and corporate standards"
  type        = string

  validation {
    condition = ((length(var.s3_bucket) > 2 && length(var.s3_bucket) < 64)
      && (length(regexall("^[a-z0-9-]+$", var.s3_bucket)) > 0)
      && (length(regexall("^[a-z0-9]", var.s3_bucket)) > 0)
      && (length(regexall("[a-z0-9]$", var.s3_bucket)) > 0)
      # some CSP constraints above, corporate constraints below
      && (length(regexall("\\.", var.s3_bucket)) == 0)
      && (length(regexall("^(pub|prv)(-[a-z0-9]+)*$", var.s3_bucket)) > 0)
      && (length(regexall("^[a-z0-9]+-(na|eu|ap)(-[a-z0-9]+)*$", var.s3_bucket)) > 0)
      && (length(regexall("-", var.s3_bucket)) > 1)
      && (length(regex("^[a-z0-9]+", var.s3_bucket)) > 2)
    )
    error_message = <<-EOT
      Must adhere to the S3 specification.
      Must not contain '.' character.
      Must start with 'pub' or 'prv', and contain 'na', 'eu', or 'ap'.
      Must contain at least 2 hyphens and be at least 3 characters long.
    EOT
  }
}
