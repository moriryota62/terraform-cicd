# common parameter
pj    = "terraform-cicd"
env   = "delivery"
owner = "yourname"

# module parameter
## network
vpc_cidr            = "10.1.0.0/16"
subnet_public_cidrs = ["10.1.10.0/24", "10.1.11.0/24"]

## github runner
runner_download_commnad = "curl -O -L https://github.com/actions/runner/releases/download/v2.276.1/actions-runner-linux-x64-2.276.1.tar.gz"
runner_targz_name       = "actions-runner-linux-x64-2.276.1.tar.gz"
runner_config_commnad   = "./config.sh --url https://github.com/moriryota62/terraform-cicd-sample --token AMHYG4GSMSXFVB3SC764MITAC3D2S"
runner_name             = "sample-cicd"

## EC2
ec2_instance_type          = "t2.micro"
ec2_root_block_volume_size = 30
ec2_key_name               = "mori"
