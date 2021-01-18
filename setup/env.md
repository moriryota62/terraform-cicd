セットアップを行うための事前順をします。
まずは本レポジトリをクローンします。
その後、以降の手順を簡略化するために環境変数を設定します。

# クローン

任意のディレクトリで以下コマンドを実行してください。

``` sh
git clone https://github.com/moriryota62/terraform-cicd.git
```

# 環境変数の設定

以下コマンドで環境変数を設定します。
コマンドは上記クローンを実行したディレクトリがカレントである前提です。

``` sh
export BASEDIR=`pwd`
cd terraform-cicd
export DIR=`pwd`
```