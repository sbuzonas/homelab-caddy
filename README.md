# homelab-caddy

A custom [Caddy](https://caddyserver.com/) container image built with extensions useful for homelab deployments.

## Extensions

| Module | Description |
|--------|-------------|
| [caddy-dns/cloudns](https://github.com/caddy-dns/cloudns) | ClouDNS provider for ACME DNS-01 challenges |

## Usage

Pull the image from the GitHub Container Registry:

```sh
docker pull ghcr.io/sbuzonas/homelab-caddy:latest
```

Or use it in a `docker-compose.yml`:

```yaml
services:
  caddy:
    image: ghcr.io/sbuzonas/homelab-caddy:latest
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
      - "443:443/udp"
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile
      - caddy_data:/data
      - caddy_config:/config

volumes:
  caddy_data:
  caddy_config:
```

## Building locally

```sh
docker build -t homelab-caddy .
```

## Adding extensions

To add more Caddy modules, edit the `Dockerfile` and add `--with` flags to the `xcaddy build` command:

```dockerfile
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    xcaddy build \
        --with github.com/caddy-dns/cloudns \
        --with github.com/your/module
```

A full list of available modules can be found at the [Caddy download page](https://caddyserver.com/download).