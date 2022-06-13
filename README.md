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
フォルダansbleとtkn-appにdockerの実行定義ファイルである`Dockerfile`があります。
これらをまとめて`docker-compose.yaml`を用いて実行します。
```
docker-compose up -d
```

---
## 公開鍵の登録
ansibleサーバはsshで通信する必要があります。sshでの通信は`ssh-keygen`であらかじめ公開鍵と秘密鍵を作成し、ssh-keyフォルダに格納しておいてください。
公開鍵と秘密鍵は組み合わせが正しければ、作成したサーバでなくても鍵通信が可能です。ファイル内にはサーバ名が記載されていますが、扱いはメモ程度の扱いなので、違うホスト名でも何の問題もありません。



鍵を格納したら、ansibleの実行に入るのですが、playbookを実行しても途中で止まってしまいます。
```
sh ansible-execute.sh
```
理由は鍵交換後の初回通信定番のknown_host登録可否を対話型で聞かれるからです。
こちらも自動で通すコマンドをネストしてあります。
```
sh pubkey_connection.sh
```
こちらを実行してから再度ansibleを実行しましょう
```
sh ansible-execute.sh
```
