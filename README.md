# Node.jsアプリケーションとansibleサーバ自動構築
Node.jsで動くアプリケーションと、docker-composeを使ってansibleサーバを自動構築するためのソースとツール一式。
ansibleサーバ自体をコンテナ化し、初回の鍵通信もツールでネストしてあるため、早急な立ち上げが可能。

---

## 構成
|ファイル名|概要|
----|----
|src|ansbleサーバを自動構築するためのソースコード|
|service-deployment.yaml|k8sを用いてイメージをデプロイ・サービス化する定義|

---
## デプロイ方法
EKSやGKEなどのk8sの実行環境で`service-deployment.yaml`を適用します。
`kubectl`部分は自身の実行環境でk8sを適用するコマンドに置き換えて実行することも可能です。
```
kubectl apply -f service-deployment.yaml
```
---
## イメージの作成
フォルダ`ansble`と`tkn-app`にdockerの実行定義ファイルである`Dockerfile`があります。
これらをまとめて`docker-compose.yml`を用いて実行します。
