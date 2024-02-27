FROM alpine
ARG ARCH
WORKDIR /app
COPY ./rathole/target/${ARCH}/release/rathole .
USER 1000:1000
ENTRYPOINT ["./rathole"]