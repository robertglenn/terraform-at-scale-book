
output "precondition_output" {
  value = "VPC_${google_compute_network.vpc.name}_${length(google_compute_firewall.fw)}"
  precondition {
    condition = (startswith(google_compute_network.vpc.name, "corp-vpc-")
    && length(google_compute_firewall.fw) < 3)
    error_message = "VPC starts with 'corp-vpc-'; at least 3 firewalls."
  }
}
