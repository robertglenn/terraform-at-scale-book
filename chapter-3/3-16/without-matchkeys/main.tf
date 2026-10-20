
# More syntax; perhaps easier to comprehend
locals {
  filter_keys = ["app_name", "region"]
  using_for = [
    for ikey, ival in var.config_map : ival
    if contains(local.filter_keys, ikey)
  ]
}
