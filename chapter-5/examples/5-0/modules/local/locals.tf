
locals {
  safe_name   = "${var.business_unit}-${var.app_code}-${var.region}"
  safe_labels = {
    app_code      = var.app_code
    business_unit = var.business_unit
    region        = var.region
    modified_at   = lower(formatdate("MMM-DD-YYYY-hh_mm", timestamp()))
                    # for example, 'jan-02-2018-23_12'
  }
}
