
variable "multiple_buckets_config" {
  description = "Configuration for multiple buckets"
  type = map(object({
    name     = string
    location = string
  }))
}
