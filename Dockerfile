# syntax=docker/dockerfile:1

FROM caddy:2-builder AS builder

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    xcaddy build \
        --output /usr/bin/caddy \
        --with github.com/caddy-dns/cloudns

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
