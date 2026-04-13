
variable "region" {
  type        = string
  description = "Allowed regions for EC2 instances."

  validation {
    condition     = contains(["us-west-1", "us-east-1"], var.region)
    error_message = "The region must be either us-west-1 or us-east-1."
  }
}

variable "type" {
  type        = string
  description = "Allowed EC2 instance types."

  validation {
    condition     = local.instance_check
    error_message = "The type must be t3.micro (us-west-1) or t3.small (us-east-1)."
  }
}
