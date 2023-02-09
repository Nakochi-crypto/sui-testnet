# Sui Testnet

## 前提条件

- [Suiのハードウェア要件](https://docs.sui.io/devnet/build/fullnode#full-node-setup)に満たすサーバーを用意していること
- [Contaboセットアップ手順](https://www.notion.so/nakochi/Contabo-96911858ca37464c8e5ee8549db9080f)を終わらせていること

## ダウンロード

```
git clone https://github.com/Nakochi-crypto/sui-testnet.git
```

## コマンド

`cd sui-testnet` して `docker-compose.yml` のあるディレクトリに入ってから実行すること

### ビルド・更新

```
docker compose build --no-cache
```

### 起動

```
docker compose up -d
```

### ログの確認

```
docker compose logs -f
```

### 停止

```
docker compose down
```

### 停止（db wipeあり）

```
docker compose down -v
```

## 便利なサイト

### 動作確認

- https://www.scale3labs.com/check/sui
- https://node.sui.zvalid.com/
