
variable "project_id" {
  description = "Project for the resources"
  type        = string
}

variable "region_one" {
  description = "First region for the resources"
  type        = string
}

variable "region_two" {
  description = "Second region for the resources"
  type        = string
}

variable "region_one_cidr" {
  description = "First CIDR for the resources"
  type        = string
  default     = "10.2.0.0/16"
}

variable "region_two_cidr" {
  description = "Second CIDR for the resources"
  type        = string
  default     = "10.3.0.0/16"
}

variable "disk_type" {
  description = "Disk type for the attached disks"
  type        = string
  default     = "pd-ssd"
}

variable "disk_size" {
  description = "Disk size (GB) for the attached disks"
  type        = number
  default     = 100
}

variable "machine_type" {
  description = "Machine type for the compute instances"
  type        = string
  default     = "e2-medium"
}

variable "boot_disk_image" {
  description = "Boot disk OS image for the compute instances"
  type        = string
  default     = "projects/debian-cloud/global/images/family/debian-12"
}

variable "boot_disk_size" {
  description = "Boot disk size for the compute instances"
  type        = string
  default     = "pd-ssd"
}

variable "developer_group_email" {
  description = "Email of the developers group"
  type        = string
  default     = "developers@tas-11-example.com"
}
