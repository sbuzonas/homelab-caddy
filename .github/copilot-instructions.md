# Copilot Instructions for homelab-caddy

## Repository Overview

`homelab-caddy` is a homelab Caddy web server configuration repository. It is used to manage [Caddy](https://caddyserver.com/) configurations, Caddyfiles, and related infrastructure-as-code for a self-hosted homelab environment.

## Repository Layout

```
.
├── .github/
│   └── copilot-instructions.md   # This file
├── LICENSE                        # Apache 2.0 license
└── README.md                      # Project overview
```

As the repository grows, expect directories such as:

- `config/` or `Caddyfile` – Caddy server configuration files
- `docker-compose.yml` or `compose.yaml` – Docker Compose service definitions
- `.env.example` – Example environment variable file (never commit real secrets)

## Technology Stack

- **Caddy** – Modern, automatic-HTTPS web server; configurations are written in Caddyfile syntax or JSON
- **Docker / Docker Compose** – Likely used to run Caddy in the homelab
- **Shell scripts** – For any automation or deployment helpers

## Development Guidelines

- **Caddyfile syntax**: Follow official [Caddyfile documentation](https://caddyserver.com/docs/caddyfile). Use directives in the correct order (site blocks, global options block at top if present).
- **Secrets**: Never commit secrets, passwords, API keys, or tokens. Use environment variables and `.env` files (add `.env` to `.gitignore`).
- **Docker**: If a `docker-compose.yml` is present, use `docker compose` (v2 CLI) rather than `docker-compose` (v1).
- **Validation**: Validate Caddyfile syntax before committing using `caddy validate --config <path>` if Caddy is available, or by running `docker compose run --rm caddy caddy validate --config /etc/caddy/Caddyfile`.

## Build / Run / Test

There is currently no build system or CI pipeline. As the repository evolves:

- **Lint/validate Caddyfile**: `caddy fmt --overwrite <Caddyfile>` (auto-formats) and `caddy validate --config <Caddyfile>`
- **Start services**: `docker compose up -d`
- **Stop services**: `docker compose down`
- **View logs**: `docker compose logs -f caddy`

## Coding Style

- Use 2-space or tab indentation consistent with existing files in the repository.
- Keep Caddyfile directives organized: global options block first, then site blocks sorted logically (e.g., by domain name).
- Add comments in Caddyfiles using `#` to explain non-obvious configuration choices.
- Prefer environment variable substitution (`{env.VAR_NAME}`) over hardcoded values for host names, ports, and credentials.

## Key Notes

- The repository is in early stages; when adding new configuration files, follow the patterns established in any existing files.
- If no existing pattern is found, prefer the simplest possible solution that fulfills the requirement.
- Trust these instructions and only search the codebase if the information here appears incomplete or incorrect.
