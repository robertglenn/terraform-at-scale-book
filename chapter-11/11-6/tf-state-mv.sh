#!/bin/bash

tf state mv google_compute_network.default module.network.google_compute_network.default
tf state mv google_compute_subnetwork.region_one module.network.google_compute_subnetwork.region_one
tf state mv google_compute_subnetwork.region_two module.network.google_compute_subnetwork.region_two
