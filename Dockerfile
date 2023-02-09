FROM rust:1.67-bullseye AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata \
    ca-certificates \
    build-essential \
    pkg-config \
    cmake \
    libclang-dev

RUN git clone --depth 1 --branch testnet https://github.com/MystenLabs/sui.git
RUN cd sui && cargo build --release --bin sui-node

FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata \
    ca-certificates \
    curl

COPY --from=builder /sui/target/release/sui-node /usr/local/bin/
COPY fullnode.yaml .
RUN curl -fLJO https://github.com/MystenLabs/sui-genesis/raw/main/testnet/genesis.blob

CMD ["sui-node", "--config-path", "fullnode.yaml"]
