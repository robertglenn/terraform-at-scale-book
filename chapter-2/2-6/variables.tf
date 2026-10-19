variable "nested_object_variable" {
  description = "this variable may be overly complex"
  type = object({
    string_key     = string
    number_map_key = map(number)
    object_key = object({
      number_sub_key      = number
      string_list_sub_key = list(string)
      object_sub_key = object({
        boolean_sub_sub_key    = bool
        string_set_sub_sub_key = set(string)
      })
    })
  })
  default = {
    string_key     = ""
    number_map_key = {}
    object_key = {
      number_sub_key      = 0
      string_list_sub_key = []
      object_sub_key = {
        boolean_sub_sub_key    = false
        string_set_sub_sub_key = []
      }
    }
  }
}