#!/bin/bash
# import-dev.sh
tf import -chdir=env/dev google_compute_network.default projects/tas-11-dev/global/networks/tas-11-dev-vpc
tf import -chdir=env/dev google_compute_subnetwork.region_one projects/tas-11-dev/regions/us-central1/subnetworks/tas-11-dev-us-central1-snet
tf import -chdir=env/dev google_compute_subnetwork.region_two projects/tas-11-dev/regions/us-west1/subnetworks/tas-11-dev-us-west1-snet
tf import -chdir=env/dev google_compute_instance.region_one projects/tas-11-dev/zones/us-central1-a/instances/tas-11-dev-us-central1-comp
tf import -chdir=env/dev google_compute_instance.region_two projects/tas-11-dev/zones/us-west1-b/instances/tas-11-dev-us-west1-comp