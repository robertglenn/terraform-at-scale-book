#!/usr/bin/env bash
set -euo pipefail

JOB_ENV="${JOB_ENV:-dev}"
MAKE_PUBLIC="${MAKE_PUBLIC:-false}"

case "$JOB_ENV" in
  dev)
    export TF_VAR_environment="dev"
    export NETWORK_TIER="internal"
    ;;
  prod)
    export TF_VAR_environment="prod"
    export NETWORK_TIER="restricted"
    ;;
  *)
    echo "ERROR: Unknown JOB_ENV '$JOB_ENV'"
    exit 1
    ;;
esac

if [[ "$MAKE_PUBLIC" == "true" ]]; then
  export ENABLE_PUBLIC_NETWORKING="true"
else
  export ENABLE_PUBLIC_NETWORKING="false"
fi

terraform init
terraform apply -auto-approve

echo "Provisioning complete."
