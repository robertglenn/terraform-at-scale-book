
locals {
  all_items = (
    contains(var.list_to_check, item.attribute) 
    ? concat(item, module.other.items) 
    : module.other.items
  )
}
