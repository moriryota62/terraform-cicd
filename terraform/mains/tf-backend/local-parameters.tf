# parameter settings
locals {
  # common parameter
  pj        = "terraform-cicd"
  env       = "delivery"
  owner     = "yourname"

  base_name = "${local.pj}-${local.env}"
  tags = {
    pj    = local.pj
    env   = local.env
    owner = local.owner
  }
}