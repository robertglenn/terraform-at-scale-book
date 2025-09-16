
variable "third_party_module_field" {
  description = "This variable is developed by a third party"
  type        = object({
    string_key     = string
    digit_map_key  = map(number)
  })
  validation {
    condition = (regexall("^[a-z]+$", var.third_party_module_field.string_key) 
      && alltrue([
        for val in values(var.third_party_module_field.digit_map_key) 
        : parseint(val, 10) > 0])
      )
    error_message = "string_key must be lowercase letters and the values of the digit_map_key must all be positive digital integers"
  }
}
