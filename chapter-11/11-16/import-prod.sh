#!/bin/bash
# import-prod.sh
tf import -chdir=env/prod google_compute_network.default projects/tas-11-prod/global/networks/tas-11-prod-vpc
tf import -chdir=env/prod google_compute_subnetwork.region_one projects/tas-11-prod/regions/us-central1/subnetworks/tas-11-prod-us-central1-snet
tf import -chdir=env/prod google_compute_subnetwork.region_two projects/tas-11-prod/regions/us-west1/subnetworks/tas-11-prod-us-west1-snet
tf import -chdir=env/prod google_compute_instance.region_one projects/tas-11-prod/zones/us-central1-a/instances/tas-11-prod-us-central1-comp
tf import -chdir=env/prod google_compute_instance.region_two projects/tas-11-prod/zones/us-west1-b/instances/tas-11-prod-us-west1-comp