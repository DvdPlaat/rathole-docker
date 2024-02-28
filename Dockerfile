FROM alpine as bamd64
WORKDIR /app
COPY ./rathole/target/x86_64-unknown-linux-musl/release/rathole .
WORKDIR /app
FROM alpine as barm64
COPY ./rathole/target/aarch64-unknown-linux-musl/release/rathole .

ARG TARGETARCH
FROM b${TARGETARCH}
WORKDIR /app
USER 1000:1000
ENTRYPOINT ["./rathole"]