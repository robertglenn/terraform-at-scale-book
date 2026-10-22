#!/bin/bash
tf state mv google_storage_bucket.default \
  local_main.google_storage_bucket.default
tf state mv google_storage_bucket_iam_member.bucket_admin \
  local_main.google_storage_bucket_iam_member.bucket_admin
tf state mv google_project_iam_member.compute_admin \
  local_main.google_project_iam_member.compute_admin
tf state mv google_compute_disk.region_one \
  module.compute.google_compute_disk.region_one
tf state mv google_compute_instance.region_one \
  module.compute.google_compute_instance.region_one
tf state mv google_compute_disk.region_two \
  module.compute.google_compute_disk.region_two
tf state mv google_compute_instance.region_two \
  module.compute.google_compute_instance.region_two
tf state mv google_compute_network.default \
  module.network.google_compute_network.default
tf state mv google_compute_subnetwork.region_one \
  module.network.google_compute_subnetwork.region_one
tf state mv google_compute_subnetwork.region_two \
  module.network.google_compute_subnetwork.region_two
