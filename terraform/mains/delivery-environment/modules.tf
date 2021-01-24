module "network" {
  source = "../../modules/network"

  base_name = local.base_name
  tags      = local.tags

  vpc_cidr            = local.vpc_cidr
  subnet_public_cidrs = local.subnet_public_cidrs
}

module "github_runner" {
  source = "../../modules/github-actions"

  pj     = local.pj
  tags   = local.tags
  vpc_id = module.network.vpc_id

  runner_download_commnad = local.runner_download_commnad
  runner_targz_name       = local.runner_targz_name
  runner_config_commnad   = local.runner_config_commnad
  runner_name             = local.runner_name

  ec2_instance_type          = local.ec2_instance_type
  ec2_subnet_id              = module.network.public_subnet_ids[0]
  ec2_root_block_volume_size = local.ec2_root_block_volume_size
  ec2_key_name               = local.ec2_key_name

}