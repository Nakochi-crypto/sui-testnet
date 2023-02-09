FROM rust:1.67-bullseye AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    libclang-dev

RUN curl -fLJO https://github.com/MystenLabs/sui-genesis/raw/main/testnet/genesis.blob

RUN git clone --depth 1 --branch testnet https://github.com/MystenLabs/sui.git
RUN cd sui && cargo build --release --bin sui-node

FROM debian:bullseye-slim

COPY --from=builder /sui/target/release/sui-node /usr/local/bin/
COPY --from=builder /genesis.blob .
COPY fullnode.yaml .

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates

CMD ["sui-node", "--config-path", "fullnode.yaml"]
