# terraform-cicd

## 実装するCICDの概要

- 対象のクラウドはAWS
- レポジトリはGitHub
- ブランチ戦略はGitLab-Flowで開発と本番の2環境存在する
  - 開発は`dev`ブランチ
  - 本番は`prod`ブランチ
- GitHub Actionsを実行する`deli`環境が存在する
- 各ブランチにPRするとGitHub Actionsで以下テストが行われる
  - 構文チェック（terraform validate）
  - ポリシーチェック（OPA）
- PRにterraform planの結果がコメントに貼られる
- PRがマージされるとGitHub Actionsにより各環境へデプロイが行われる

## やること

- deli環境の構築
- テスト用の`dev`と`prod`レポジトリ作成
- 各レポジトリにGitHub Actionsを使うための設定
- GitHub ActionsでCI(terraform validate)
- GitHub ActionsでCI(OPA)
- GitHub ActionsでTerraformをデプロイ
- PRにterraform planの結果を貼り付ける方法を調べる