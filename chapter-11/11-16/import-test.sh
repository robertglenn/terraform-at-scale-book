#!/bin/bash

# import-test.sh
tf -chdir=env/test import google_compute_network.default \
  projects/tas-11-test/global/networks/tas-11-test-vpc
tf -chdir=env/test import google_compute_subnetwork.region_one \
  projects/tas-11-test/regions/us-central1/subnetworks/tas-11-test-us-central1-snet
tf -chdir=env/test import google_compute_subnetwork.region_two \
  projects/tas-11-test/regions/us-west1/subnetworks/tas-11-test-us-west1-snet
tf -chdir=env/test import google_compute_instance.region_one \
  projects/tas-11-test/zones/us-central1-a/instances/tas-11-test-us-central1-comp
tf -chdir=env/test import google_compute_instance.region_two \
  projects/tas-11-test/zones/us-west1-b/instances/tas-11-test-us-west1-comp
