
variable "items" {
  description = "Configuration items"
  type = list(object({
    name      = string
    other_key = number
  }))
}
