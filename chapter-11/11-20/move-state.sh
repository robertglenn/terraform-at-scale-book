#!/bin/bash

terraform workspace select default
terraform state pull > default_backup.tfstate
terraform workspace select dev
terraform state push default_backup.tfstate
