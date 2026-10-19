
vm_inputs = [
  {
    name              = "vm-3-5-has-attached-one-nic"
    has_attached_disk = true
    has_second_nic    = false
  },
  {
    name              = "vm-3-5-no-attached-two-nics"
    has_attached_disk = false
    has_second_nic    = true
  }
]
