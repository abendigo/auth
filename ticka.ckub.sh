docker run -d \
  -l traefik.http.routers.ticka.rule="Host(\`ticka.club\`)" \
  -l traefik.http.routers.ticka.entrypoints=http \
  -l traefik.http.routers.ticka.middlewares=redirect@file \
  -l traefik.http.routers.ticka-secured.rule="Host(\`ticka.club\`)" \
  -l traefik.http.routers.ticka-secured.entrypoints=https \
  -l traefik.http.routers.ticka-secured.tls=true \
  -l traefik.http.routers.ticka-secured.tls.certResolver=sample \
  -l traefik.enable=true \
  --network web \
  --name ticka.club \
  --rm \
  docker.pkg.github.com/abendigo/ticka.club/ticka.club:6a54681ce9491bf1bccc82d7df17c6ebb1eca333
