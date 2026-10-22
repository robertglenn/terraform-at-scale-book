
variable "project_id" {
  description = "Project for the resources"
  type        = string
}

variable "location" {
  description = "Location for the Storage bucket"
  type        = string
}

variable "developer_group_email" {
  description = "Email of the developers group"
  type        = string
}

variable "bucket_name" {
  description = "Name for the Storage bucket"
}
