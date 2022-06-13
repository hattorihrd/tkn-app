# Node.jsアプリケーションとansibleサーバ自動構築
Node.jsで動くアプリケーションと、docker-composeを使ってansibleサーバを自動構築するためのソースとツール一式。
ansibleサーバ自体をコンテナ化し、初回の鍵通信もツールでネストしてあるため、早急な立ち上げが可能。

## 構成
|ファイル名|概要|
----|----
|src|ansbleサーバを自動構築するためのソースコード|
|deployment-service.yaml|k8sを用いてイメージをデプロイ・サービス化する定義|
