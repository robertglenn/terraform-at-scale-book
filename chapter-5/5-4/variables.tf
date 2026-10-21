
variable "network_data" {
  description = "Network data for VPC networks."

  type = object({
    domain = string
    ranges = list(string)
    region = string
  })
}
