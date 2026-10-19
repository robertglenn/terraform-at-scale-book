#!/bin/bash
tf state rm google_compute_network.default
tf state rm google_compute_subnetwork.region_one
tf state rm google_compute_subnetwork.region_two
