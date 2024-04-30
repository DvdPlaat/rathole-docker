# Amd64 build
FROM debian:slim  as bamd64
WORKDIR /app
COPY ./rathole/target/x86_64-unknown-linux-gnu/release/rathole .
# Raspberry PI build
FROM debian:slim as barm64
WORKDIR /app
COPY ./rathole/target/aarch64-unknown-linux-musl/release/rathole .

ARG TARGETARCH
# Start from the previous build based on arch 
# https://www.docker.com/blog/faster-multi-platform-builds-dockerfile-cross-compilation-guide/
# https://stackoverflow.com/questions/31528384/conditional-copy-add-in-dockerfile
FROM b${TARGETARCH}
WORKDIR /app
USER 1000:1000
ENTRYPOINT ["./rathole"]