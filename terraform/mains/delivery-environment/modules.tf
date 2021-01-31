module "network" {
  source = "../../modules/network"

  base_name = local.base_name
  tags      = local.tags

  vpc_cidr            = var.vpc_cidr
  subnet_public_cidrs = var.subnet_public_cidrs
}

module "github_runner" {
  source = "../../modules/github-actions"

  pj     = var.pj
  tags   = local.tags
  vpc_id = module.network.vpc_id

  runner_download_commnad = var.runner_download_commnad
  runner_targz_name       = var.runner_targz_name
  runner_config_commnad   = var.runner_config_commnad
  runner_name             = var.runner_name

  ec2_instance_type          = var.ec2_instance_type
  ec2_subnet_id              = module.network.public_subnet_ids[0]
  ec2_root_block_volume_size = var.ec2_root_block_volume_size
  ec2_key_name               = var.ec2_key_name

}