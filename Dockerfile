FROM rust:1.67-bullseye AS builder

ARG branch_or_tag="testnet"

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    libclang-dev

RUN if [ "$branch_or_tag" = "testnet" ]; then \
        curl -fLJO https://github.com/MystenLabs/sui-genesis/raw/main/testnet/genesis.blob; \
    else \
        curl -fLJO https://github.com/MystenLabs/sui-genesis/raw/main/devnet/genesis.blob; \
    fi

RUN git clone --depth 1 --branch "$branch_or_tag" https://github.com/MystenLabs/sui.git
RUN cd sui && cargo build --release --bin sui-node

FROM debian:bullseye-slim

COPY --from=builder /sui/target/release/sui-node /usr/local/bin/
COPY --from=builder /genesis.blob .
COPY fullnode.yaml .

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates

CMD ["sui-node", "--config-path", "fullnode.yaml"]
