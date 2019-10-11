docker run -d \
  -l traefik.http.routers.freeroll.rule="Host(\`freeroll.oosterveld.org\`)" \
  -l traefik.http.routers.freeroll.entrypoints=http \
  -l traefik.http.routers.freeroll.middlewares=redirect@file \
  -l traefik.http.routers.freeroll-secured.rule="Host(\`freeroll.oosterveld.org\`)" \
  -l traefik.http.routers.freeroll-secured.entrypoints=https \
  -l traefik.http.routers.freeroll-secured.tls=true \
  -l traefik.http.routers.freeroll-secured.tls.certResolver=sample \
  -l traefik.enable=true \
  --network web \
  --name nginx \
  --rm \
  nginx
