
variable "app_code" {
  type        = string
  description = "Codename for the application."

  validation {
    condition     = contains(["app1", "app2", "app3"], var.app_code)
    error_message = "Must be one of app1, app2, app3"
  }
}

variable "business_unit" {
  type        = string
  description = "Codename of the business unit."

  validation {
    condition     = contains(["bu1", "bu2"], var.business_unit)
    error_message = "Must be one of bu1 or bu2"
  }
}

variable "region" {
  type        = string
  description = "Region things run in."

  validation {
    condition     = contains(["us-west1", "us-east1", "us-central1"], var.region)
    error_message = "Must be one of us-west1, us-east1, us-central1"
  }
}
