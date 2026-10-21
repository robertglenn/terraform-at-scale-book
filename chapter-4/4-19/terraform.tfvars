vm_name = "vm-name-4-19"
vm_type = "n2-standard-2"
disk_configs = {
  "dsk-primary" : { disk_name : "dsk-primary", device_name : "dev-primary" },
  "dsk-backup" : { disk_name : "dsk-backup", device_name : "dev-backup" }
}
nic_configs = {
  "snet-dev" : { subnet_name : "snet-dev", public_access : true },
  "snet-admin" : { subnet_name : "snet-admin", public_access : false }
}
