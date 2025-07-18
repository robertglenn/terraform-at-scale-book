
variable "vms_map" {
  description = "value"
  type = map(object({
    app_id = string
    zone         = string
    machine_type = string
    network      = string
    image        = string
  }))
}
