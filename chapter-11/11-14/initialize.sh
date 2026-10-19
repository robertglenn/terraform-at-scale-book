#!/bin/bash
tf -chdir=envs/dev init -backend-config="prefix=path/to/dev-backend"
tf -chdir=envs/test init -backend-config="prefix=path/to/test-backend"
tf -chdir=envs/prod init -backend-config="prefix=path/to/prod-backend"
