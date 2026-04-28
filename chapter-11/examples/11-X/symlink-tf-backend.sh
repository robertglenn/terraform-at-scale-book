# create the directories
mkdir -p envs/prod
mkdir -p envs/dev

# create the symlink
ln -s $PWD "$PWD/envs/prod"
ln -s $PWD "$PWD/envs/dev"

# initialize the backends
tf -chdir=envs/prod -backend-config="prefix=path/to/prod-backend" init
tf -chdir=envs/dev -backend-config="prefix=path/to/dev-backend" init

# plan each configuration
tf -chdir=envs/prod -var-file="envs/terraform.tfvars" plan
tf -chdir=envs/dev -var-file="envs/terraform.tfvars" plan
