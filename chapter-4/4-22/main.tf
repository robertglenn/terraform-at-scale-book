
locals {
  items = { for item in var.items : item.name => item }
  invrt = { for key, val in google_compute_instance.long_name.labels : val => key }
  final = merge(local.items, local.invrt)
}
