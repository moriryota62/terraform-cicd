# common parameter
variable "pj" {
  description = "プロジェクト名"
  type = string
}

variable "env" {
  description = "環境名"
  type = string
}

variable "owner" {
  description = "作成者の名前"
  type = string
}

# module parameter
## network
variable "vpc_cidr" {
  description = "作成するVPCのCIDR"
  type = string
}

variable "subnet_public_cidrs" {
  description = "作成するパブリックサブネットのCIDRリスト"
  type = list(string)
}

## github runner
variable "runner_download_commnad" {
  description = "GitHub Actions Runnerのバイナリダウンロードコマンド。（GUIに表示されるやつ）"
  type = string
}

variable "runner_targz_name" {
  description = "GitHub Actions Runnerのバイナリtar.gzファイル名。(ダウンロードコマンドでダウンロードするファイル名)"
  type = string
}

variable "runner_config_commnad" {
  description = "GitHub Actions Runnerのセットアップコマンド。（GUIに表示されるやつ）"
  type = string
}

variable "runner_name" {
  description = "作成するGitHub Actions Runnerの名前"
  type = string
}

## EC2
variable "ec2_instance_type" {
  description = "EC2インスタンスのインスタンスタイプ"
  type = string
}

variable "ec2_root_block_volume_size" {
  description = "EC2インスタンスのルートディスクの容量"
  type = string
}

variable "ec2_key_name" {
  description = "EC2ログインに使うキーペア名"
  type = string
}
