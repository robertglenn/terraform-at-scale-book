
variable "intermediate_string_key" {
  description = "This is a string to be used in the third-party submodule"
  type        = string
}

variable "intermediate_number_list" {
  description = "This is a list of numbers to be passed to the third-party submodule"
  type        = list(number)
}
