
config_map = {
  fw_1 = {
    firewall_name = "fw-3-3-01"
    network_name  = "trust-vpc-3-3"
  }
  fw_2 = {
    firewall_name = "fw-3-3-02"
    network_name  = "untrust-vpc-3-3"
  }
}
port_data = [
  {
    port     = "80"
    protocol = "tcp"
  },
  {
    port     = "443"
    protocol = "tcp"
  },
  {
    port     = "53"
    protocol = "udp"
  }
]
