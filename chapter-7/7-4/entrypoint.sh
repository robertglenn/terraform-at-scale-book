#!/bin/bash
set -euo pipefail

JOB_ENV="${JOB_ENV:-dev}"
MAKE_PUBLIC="${MAKE_PUBLIC:-false}"

case "$JOB_ENV" in
  dev)
    export TF_VAR_environment="dev"
    export TF_VAR_network_tier="internal"
    ;;
  prod)
    export TF_VAR_environment="prod"
    export TF_VAR_network_tier="restricted"
    ;;
  *)
    echo "ERROR: Unknown JOB_ENV '$JOB_ENV'"
    exit 1
    ;;
esac

if [[ "$MAKE_PUBLIC" == "true" ]]; then
  export TF_VAR_enable_public_networking="true"
else
  export TF_VAR_enable_public_networking="false"
fi

terraform init
terraform apply -auto-approve

echo "Provisioning complete."
