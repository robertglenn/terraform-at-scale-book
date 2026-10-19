
variable "string_key_var" {
  description = "String for the string_key"
  type        = string
}

variable "number_map_key_var" {
  description = "number map for the number_map_key"
  type        = map(number)
}

variable "number_sub_key_var" {
  description = "number for the number_sub_key"
  type        = number
}

variable "string_list_sub_key_var" {
  description = "string list for the string_list_sub_key"
  type        = list(string)
}
