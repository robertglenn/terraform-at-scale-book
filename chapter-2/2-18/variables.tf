
variable "s3_bucket" {
  description = "bucket with CSP constraints and link to the documentation"
  type        = string

  validation {
    condition = (length(var.s3_bucket) > 2 && length(var.s3_bucket) < 64
      && (length(regexall("^[a-z0-9-]+$", var.s3_bucket)) > 0)
      && (length(regexall("^[a-z0-9]", var.s3_bucket)) > 0)
    && (length(regexall("[a-z0-9]$", var.s3_bucket)) > 0))
    error_message = join(" ", [
      "Must follow AWS bucket naming rules. See",
      join("/", [
        "https://docs.aws.amazon.com/AmazonS3/latest",
        "userguide/bucketnamingrules.html"
      ]),
      "for more details."
    ])
  }
}
