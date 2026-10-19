
# Directly using a number
variable "conditional_control_variable_s3" {
  description = "set this to 1 to create the conditional S3 resource"
  type        = number
  default     = 0
}

# Using a ternary expression
variable "conditional_name_variable_ec2" {
  description = "set this to any valid string to create the EC2 resource"
  type        = string
  default     = ""
}

variable "default_ami" {
  description = "AMI ID to use in the EC2 instance"
  type        = string
}
