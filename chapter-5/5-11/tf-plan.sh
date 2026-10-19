#!/bin/bash

sed -i 's@[VERSION_REFERENCE]@?ref=v2.0.1@g' main.tf
tf plan
