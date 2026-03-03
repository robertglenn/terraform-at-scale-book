
variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "app_engine_region" {
  type    = string
  default = "us-central"
}

variable "subnet_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "serverless_cidr" {
  type    = string
  default = "10.8.0.0/28"
}

variable "db_name" {
  type    = string
  default = "appdb"
}

variable "db_user" {
  type    = string
  default = "appuser"
}

variable "db_password" {
  type      = string
  sensitive = true
}
