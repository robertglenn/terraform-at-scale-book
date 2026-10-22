
variable "project_id" {
  description = "Project for the resources"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "region_one" {
  description = "First region to place resources in"
  type        = string
}

variable "region_two" {
  description = "Second region to place resources in"
  type        = string
}

variable "region_one_cidr" {
  description = "First CIDR for the resources"
  type        = string
}

variable "region_two_cidr" {
  description = "Second CIDR for the resources"
  type        = string
}
