
Terraformのtfstateを保存するバックエンドをS3で構築します。
また、環境を複数人で共有することを想定し、DynamoDBによる排他制御も行います。

なお、バックエンドは各環境（Delivery/Dev/Pod）ごとに用意します。
バックエンドをすべてまとめてしまうとある環境の作業により、他環境の作業ができなくなってしまうのを防ぐためです。
また、開発環境と本番環境を完全に分離するためにも分けて構成した方が良いと考えました。

# デプロイ（Delivery）

バックエンド構築用のTerraformを配置したディレクトリに移動します。

``` sh
cd $DIR/terraform/terraform-backend
```

このままmain.tfを使用してもバックエンドは構築できます。
main.tfのlocalsには以下のパラメータを設定しています。
とくに`pj`は必要に応じて修正してください。
またリージョンは`us-east-2`を指定していますので別リージョンにしたい場合は修正してください。

```terraform 
locals {
  pj        = "terraform-cicd"
  env       = "delivery"
  owner     = "yourname"
...
}
```

Terraformを実行します。

``` sh
terraform init
terraform plan
terraform apply
> yes
```

Terraformの実行後は以下バックエンドを使用できます。

```terraform
  backend "s3" {
    bucket         = "terraform-cicd-tfstate"
    dynamodb_table = "terraform-cicd-tfstate-lock"
    region         = "us-east-2"
  }
```

# デプロイ（Dev）

開発環境用のtfstateも用意します。

# デプロイ（Prod）

本番環境用のtfstateも用意します。
