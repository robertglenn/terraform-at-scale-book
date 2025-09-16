
variable "submodule_variable" {
  description = "value"
  type        = object({
    string_val      = string
    number_list_val = list(number)
  })
  default = {
    string_val      = "whatShouldThisBe?"
    number_list_val = []
  }
}
