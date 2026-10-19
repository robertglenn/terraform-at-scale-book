
  variable "subnets" {
    description = "Subnets to configure for the VPC"
    type        = map(object({
      ip_cidr_range = string
      region        = string
+     secondaries   = map(string)
    }))
  }
