
variable "network_name" {
  description = "value"
  type        = string
}
variable "scratch_map" {
  description = "value"
  type = map(object({
    interface = string
  }))
}
