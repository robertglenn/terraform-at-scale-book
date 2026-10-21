
variable "regions" {
  description = "Resource regions where network resources will be created"
  type        = list(string)
}

variable "network" {
  description = "VPC where the subnets get created"
  type        = string
}
