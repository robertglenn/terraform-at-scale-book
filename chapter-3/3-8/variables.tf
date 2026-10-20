
variable "vms_map" {
  type = map(object({
    app_id       = string
    zone         = string
    type         = string
    machine_type = string
    # ...
  }))
}
