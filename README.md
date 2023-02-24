# Sui Testnet

[日本語](https://github.com/Nakochi-crypto/sui-testnet/blob/main/README.ja.md)

## Requirements

- [Sui hardware requirements](https://docs.sui.io/devnet/build/fullnode#full-node-setup)
- [Docker Compose](https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script)

## Download

```
git clone https://github.com/Nakochi-crypto/sui-testnet.git
```

## For devnet

Edit `docker-compose.yml` like this:

```yaml
build:
  context: .
  args:
    branch_or_tag: devnet-0.27.0
```

## Commands

`cd sui-testnet` before execution

### Build / Update

```
docker compose build --no-cache
```

### Run a fullnode

```
docker compose up -d
```

### View logs

```
docker compose logs -f
```

### Stop

```
docker compose down
```

### Stop (db swipe)

```
docker compose down -v
```

## Useful sites

### Node checker

- https://www.scale3labs.com/check/sui
- https://node.sui.zvalid.com/
