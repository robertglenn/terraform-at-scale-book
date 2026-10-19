
# 2 instances will be placed in the same region
vm_instance = [
  {
    name         = "vm-3-2-01"
    machine_type = "n2-standard-2"
  },
  {
    name         = "vm-3-2-02"
    machine_type = "n2-standard-4"
  },
  {
    name         = "vm-3-2-03"
    machine_type = "n2-standard-8"
  },
  {
    name         = "vm-3-2-04"
    machine_type = "n2-standard-16"
  }
]
