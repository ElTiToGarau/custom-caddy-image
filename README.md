# custom-caddy-image

Imatge de [Caddy](https://caddyserver.com/) amb el mòdul DNS de
[Cloudflare](https://github.com/caddy-dns/cloudflare), compilada amb GitHub Actions
i publicada a GitHub Container Registry (`ghcr.io`).

## Quan es compila

- A cada push a `main` que toqui el `Dockerfile` o el workflow.
- Cada dilluns a les 04:00 UTC (per agafar versions noves de Caddy / del mòdul).
- A mà des de la pestanya **Actions → Build & push Caddy image → Run workflow**.

## Tags publicats

| Tag                    | Exemple                  | Ús                                  |
|------------------------|--------------------------|-------------------------------------|
| `latest`               | `latest`                 | Sempre l'última build               |
| `<versió caddy>`       | `2.10.2`                 | Fixar una versió concreta de Caddy  |
| `<versió>-<data>`      | `2.10.2-20261130`        | Fixar una build exacta              |
| `sha-<commit>`         | `sha-a1b2c3d`            | Build d'un commit concret           |

El workflow comprova que el mòdul `dns.providers.cloudflare` és present abans de publicar.

## Ús

```yaml
services:
  caddy:
    image: ghcr.io/eltitogarau/custom-caddy-image:latest
```
