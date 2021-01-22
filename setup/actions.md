
GitHubのCICD機能であるGitHub Actionsを使うための準備をします。
GitHub Actionsのジョブを実行するRunnerはセルフホストで構築します。
AWSにEC2を立て、Runnerをインストールします。
最後に簡単なパイプラインを実行してみます。

# レポジトリの作成

GitHubにログインしレポジトリを作成します。
名前は任意でよいです。
今回は`terraform-cicd-test`というレポジトリを作成します。

# GitHub Actions Runnerのアクセストークン発行

セルフホストRunnerを設定する時に使用するアクセストークンを発行します。
作成したレポジトリ`terraform-cicd-test`にWebブラウザでアクセスし、以下手順を行います。

- [settings]-[Actions]を選択
- `Self-hosted runners`の`Add runner`を選択
- **Configure**にある`config.sh`を実行するコマンドを行ごとコピー（後ほど使います）

# GitHub Actions Runnerのデプロイ

GitHub Actions RunnnerをTerraformを使ってデプロイします。

``` sh
cd $DIR/terraform/github-actions
```

