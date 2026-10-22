
variable "project_id" {
  description = "Project for the resources"
  type        = string
}

variable "app_name" {
  description = "Codename for the app to use as resource name prefix"
  type        = string
  default     = "app"
}

variable "region_one" {
  description = "First region for the resources"
  type        = string
}

variable "region_two" {
  description = "Second region for the resources"
  type        = string
}

variable "zone_one" {
  description = "First zone to place resources in"
  type        = string
}

variable "zone_two" {
  description = "Second zone to place resources in"
  type        = string
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

variable "subnet_one_link" {
  description = "Self link for the first subnet"
  type        = string
}

variable "subnet_two_link" {
  description = "Self link for the second subnet"
  type        = string
}

