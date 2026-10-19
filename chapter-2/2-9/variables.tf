
variable "object_variable_nested_any" {
  description = <<-EOT
    including the any type within a larger object variable obscures appropriate
    values
  EOT
  type = object({
    stringKey      = string
    keyWithAnyType = any # can be set to any primitive or JSON-like value
  })
}

variable "map_any_variable" {
  description = <<-EOT
    including the any type within a map variable requires all values to be the
    same (valid) type, but otherwise no other constraints
  EOT
  type        = map(any) # the values must still have a consistent type
}
