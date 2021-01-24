# common parameter
variable "tags" {
  description = "リソース群に付与する共通タグ"
  type        = map(string)
}

variable "pj" {
  description = "リソース群に付与する接頭語"
  type        = string
}

variable "vpc_id" {
  description = "リソース群が属するVPCのID"
  type        = string
}

# module parameter
variable "runner_download_commnad" {
  description = "GitHub Actions Runnerのインストーラをダウンロードするコマンド(GitHubの画面に表示されるコマンド)"
  type        = string
}

variable "runner_targz_name" {
  description = "GitHub Actions Runnerのインストーラファイル名"
  type        = string
}

variable "runner_config_commnad" {
  description = "GitHub Actions Runnerをセットアップするコマンド(GitHubの画面に表示されるコマンド)"
  type        = string
}
variable "runner_name" {
  description = "GitHub Actions Runnerの登録名"
  type        = string
}
variable "runner_workdir" {
  description = "GitHub Actions Runnerのワークディレクトリ"
  type        = string
  default     = "_work"
}

variable "ec2_instance_type" {
  description = "GitHub Runnerのインスタンスタイプ"
  type        = string
  default     = "t2.micro"
}

variable "ec2_subnet_id" {
  description = "GitHub Runnerを配置するパブリックサブネットのID"
  type        = string
}

variable "ec2_root_block_volume_size" {
  description = "GitHub Runnerのルートデバイスの容量(GB)"
  type        = string
  default     = 30
}

variable "ec2_key_name" {
  description = "GitHub Runnerのインスタンスにsshログインするためのキーペア名"
  type        = string
  default     = null
}