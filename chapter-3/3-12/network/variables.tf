
variable "vpc_name" {
  description = "Name of the VPC to provision"
  type        = string
}

variable "regions" {
  description = "Regions to create subnets in"
  type        = list(string)
}