
# Arguably less syntax; perhaps requires elevated proficiency
locals {
  filter_keys     = ["app_name", "region"]
  vals            = values(var.config_map)
  keys            = keys(var.config_map)
  using_matchkeys = matchkeys(local.vals, local.keys, local.filter_keys)
}
