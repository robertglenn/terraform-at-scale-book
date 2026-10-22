
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Resource region for the resources"
  type        = string
  default     = "us-central1"
}

variable "app_engine_region" {
  description = "App engine location"
  type        = string
  default     = "us-central"
}

variable "subnet_cidr" {
  description = "CIDR for the subnet"
  type        = string
  default     = "10.10.0.0/16"
}

variable "serverless_cidr" {
  description = "CIDR for the app engine access connector"
  type        = string
  default     = "10.8.0.0/28"
}

variable "db_name" {
  description = "Name of the SQL database"
  type        = string
  default     = "appdb"
}

variable "db_user" {
  description = "User for the SQL database"
  type        = string
  default     = "appuser"
}

variable "db_password" {
  description = "Password for the SQL database user"
  type        = string
  sensitive   = true
}
