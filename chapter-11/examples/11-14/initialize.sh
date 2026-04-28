#!/bin/bash
tf -chdir=envs/dev -backend-config="prefix=path/to/dev-backend" init
tf -chdir=envs/test -backend-config="prefix=path/to/test-backend" init
tf -chdir=envs/prod -backend-config="prefix=path/to/prod-backend" init
