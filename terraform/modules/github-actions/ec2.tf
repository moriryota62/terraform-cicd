locals {
  default_init_script = <<SHELLSCRIPT
#!/bin/bash

# Download runner
mkdir actions-runner && cd actions-runner
${var.runner_download_commnad}
tar xzf ./${var.runner_targz_name}
rm ./${var.runner_targz_name}

# setup runner
chmod 777 -R /actions-runner
su - ec2-user -c 'cd /actions-runner && ${var.runner_config_commnad} --name ${var.runner_name} --work ${var.runner_workdir}'
/actions-runner/svc.sh install
/actions-runner/svc.sh start

# install node (for terraform setup)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install node
cat <<EOF >> /root/.bashrc
export NVM_DIR="/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
EOF
ln -s `which node` /usr/local/bin/node
    SHELLSCRIPT
}

data "aws_ami" "recent_amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "github_runner" {
  ami                         = data.aws_ami.recent_amazon_linux_2.image_id
  instance_type               = var.ec2_instance_type
  iam_instance_profile        = aws_iam_instance_profile.github_runner.name
  associate_public_ip_address = true
  subnet_id                   = var.ec2_subnet_id
  vpc_security_group_ids      = [aws_security_group.github_runner.id]
  user_data                   = local.default_init_script

  tags = merge(
    {
      "Name" = "${var.pj}-github-runner"
    },
    var.tags
  )

  root_block_device {
    volume_size = var.ec2_root_block_volume_size
  }

  key_name = var.ec2_key_name

}

