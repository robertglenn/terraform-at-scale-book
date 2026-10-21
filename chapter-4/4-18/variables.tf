
variable "network_name" {
  description = "Name of the VPC in both providers"
  type        = string
}

variable "cidr_block" {
  description = "CIDR for the AWS network"
  type        = string
  default     = "10.0.0.0/16"
}
