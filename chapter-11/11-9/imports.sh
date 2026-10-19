#!/bin/bash
tf import google_compute_network.default projects/tas-11/global/networks/tas-11-vpc
tf import google_compute_subnetwork.region_one projects/tas-11/regions/us-central1/subnetworks/tas-11-us-central1-snet
tf import google_compute_subnetwork.region_two projects/tas-11/regions/us-west1/subnetworks/tas-11-us-west1-snet
