module "network" {
  source = "../../modules/network"

  base_name = local.base_name
  tags      = local.tags

  vpc_cidr             = local.vpc_cidr
  subnet_public_cidrs  = local.subnet_public_cidrs
  subnet_private_cidrs = local.subnet_private_cidrs
}
