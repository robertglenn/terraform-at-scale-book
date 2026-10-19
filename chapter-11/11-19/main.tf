
  resource "google_compute_subnetwork" "subnets" {
    for_each = var.subnets

    name          = each.key
    ip_cidr_range = each.value.ip_cidr_range
    region        = each.value.region
    network       = google_compute_network.default.id
+  
+   dynamic "secondary_ip_range" {
+     for_each = each.value.secondaries
+  
+     content {
+       range_name    = secondary_ip_range.key
+       ip_cidr_range = secondary_ip_range.value.cidr
+     }
+   }
  }
