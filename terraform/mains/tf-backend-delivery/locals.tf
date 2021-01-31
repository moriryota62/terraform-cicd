# parameter settings
locals {
  base_name = "${var.pj}-${var.env}"
  tags = {
    pj    = var.pj
    env   = var.env
    owner = var.owner
  }
}