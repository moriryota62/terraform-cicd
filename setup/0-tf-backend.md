
Terraformのtfstateを保存するバックエンドをS3で構築します。
また、環境を複数人で共有することを想定し、DynamoDBによる排他制御も行います。

# デプロイ

バックエンド構築用のTerraformを配置したディレクトリに移動します。

``` sh
cd $DIR/terraform/terraform-backend
```

このままmain.tfを使用してもバックエンドは構築できます。
main.tfのlocalsには以下のパラメータを設定しています。
とくに`pj`と`owner`は必要に応じて修正してください。
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