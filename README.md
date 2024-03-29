# nginx-container

Cloudflareとの間にSSLを有効化したnginxサーバを構築する

## 起動の準備

Cloudflareとの間の通信に利用する証明書を作成する

### CSRの作成

`./ssl/generate-key.sh`を実行してCSRを作成する

```shell
bash ./ssl/generate-key.sh
```

### 証明書を発行する

1. Cloudflareの`SSL/TLS`>`Origin Server`を開き，`Create Certificate`をクリック
1. `Use my private key and CSR`を選び，`./ssl/cloudflare.csr`を貼り付ける
1. `Create`をクリックする
1. `Origin Certificate`に表示された`PEM`データを`./ssl/cloudflare.crt`として保存する

## nginxを起動する

### 環境変数を設定する

`server_name`をコンテナ起動時に環境変数から読み取って実行するために，
`DEFAULT_SERVER_NAME`にサーバ名を定義する

DEFAULT_SERVER_NAME=example.com

### コンテナを起動する

nginxコンテナをデーモンモードで起動する

```shell
docker compose up -d nginx
```

### コンテナを停止する

```shell
docker compose down nginx
```