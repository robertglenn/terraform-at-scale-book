
# Descriptions omitted for brevity

variable "network_name" {
  type    = string
}

variable "instance_name" {
  type    = string
}

variable "machine_type" {
  type    = string
  default = "n2-standard-2"
}

variable "instance_zone" {
  type    = string
  default = "us-central1-a"
}

variable "boot_image" {
  type    = string
  default = "debian-cloud/debian-12"
}
