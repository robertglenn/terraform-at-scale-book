
firewall_configs = {
  fw_1 = {
    firewall_name = "fw-4-20-http"
    allow_configs = {
      allow_tcp = {
        protocol = "tcp"
        ports    = ["80", "443"]
      }
      allow_icmp = {
        protocol = "icmp"
        ports    = []
      }
    }
  }
  fw_2 = {
    firewall_name = "fw-4-20-dhcp"
    allow_configs = {
      allow_udp = {
        protocol = "udp"
        ports    = ["67", "68"]
      }
    }
  }
}
