
variable "submodule_string_key" {
  description = "This is a string variable"
  type        = string
}

variable "submodule_number_list" {
  description = "This is a list of numbers (optional)"
  type        = list(number)
  default     = []
}
