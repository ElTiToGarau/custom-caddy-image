# Versió de Caddy a fer servir (ex: "2", "2.10", "2.10.2").
# "2" agafa sempre l'últim 2.x publicat.
ARG CADDY_VERSION=2

FROM caddy:${CADDY_VERSION}-builder AS builder

# Valor diferent a cada execució del workflow: força recompilar xcaddy
# perquè agafi sempre l'última versió del mòdul de Cloudflare.
ARG CACHE_BUST

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
