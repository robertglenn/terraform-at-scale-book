
variable "bucket_name" {
  description = "This is the name of the bucket."
}

variable "location_with_default" {
  description = "The location for the bucket. This has a default value set to 'US'."
  type        = string
  default     = "US"
}
