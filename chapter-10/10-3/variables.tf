
variable "region" {
  type        = string
  description = "Allowed regions for EC2 instances."

  validation {
    condition     = contains(["us-west-1", "us-east-1"], var.region)
    error_message = "The region must be either us-west-1 or us-east-1."
  }
}

variable "instance_type" {
  type        = string
  description = "Allowed EC2 instance types."

  validation {
    condition     = local.instance_check
    error_message = "The type must be t3.micro (us-west-1) or t3.small (us-east-1)."
  }
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR of the VPC for the EC2 instance."
  default     = "172.16.0.0/16"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR of the subnet for the EC2 instance."
  default     = "172.16.10.0/24"
}
