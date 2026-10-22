#!/bin/bash

# create the directories
mkdir -p envs/prod
mkdir -p envs/dev

# create the symlink
ln -s "$PWD" "$PWD/envs/prod"
ln -s "$PWD" "$PWD/envs/dev"

# initialize the backends
tf -chdir=envs/prod init -backend-config="prefix=path/to/prod-backend"
tf -chdir=envs/dev init -backend-config="prefix=path/to/dev-backend"

# plan each configuration
tf -chdir=envs/prod -var-file="../terraform.tfvars" plan
tf -chdir=envs/dev -var-file="../terraform.tfvars" plan
