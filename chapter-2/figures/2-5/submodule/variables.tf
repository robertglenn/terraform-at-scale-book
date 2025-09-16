
variable "complex_module_field" {
  description = "This variable might be too complex"
  type        = object({
    string_key     = string
    number_map_key = map(number)
    object_key     = object({
      number_sub_key     = number
      stringList_sub_key = list(string)
    })
  })
}
