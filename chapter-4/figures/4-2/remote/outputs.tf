
output "dns_record_name" {
  value = (length(google_dns_record_set.a_record) > 0 
    ? google_dns_record_set.a_record[0].name : "")
}
