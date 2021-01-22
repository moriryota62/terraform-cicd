# parameter settings
locals {
  # common parameter
  pj    = "terraform-cicd"
  env   = "delivery"
  owner = "yourname"

  base_name = "${local.pj}-${local.env}"
  tags = {
    pj    = local.pj
    env   = local.env
    owner = local.owner
  }

  # module parameter
  ## network
  vpc_cidr             = "10.1.0.0/16"
  subnet_public_cidrs  = ["10.1.10.0/24", "10.1.11.0/24"]
//  subnet_private_cidrs = ["10.1.20.0/24", "10.1.21.0/24"]
  subnet_private_cidrs = null
}