# nginx-container

Cloudflareとの間にSSLを有効化したnginxサーバを構築する

## 起動の準備

Cloudflareとの間の通信に利用する証明書を作成する

### CSRの作成

`generate-key.sh`を実行してCSRを作成する

```shell
bash generate-key.sh
```

### 証明書を発行する

Cloudflareの`SSL/TLS`>`Origin Server`を開き，`Create Certificate`をクリック

`Use my private key and CSR`を選び，`cloudflare.pem`を貼り付ける