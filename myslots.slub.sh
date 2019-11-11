docker run -d \
  -l traefik.http.routers.myslots.rule="Host(\`myslots.club\`)" \
  -l traefik.http.routers.myslots.entrypoints=http \
  -l traefik.http.routers.myslots.middlewares=redirect@file \
  -l traefik.http.routers.myslots-secured.rule="Host(\`myslots.club\`)" \
  -l traefik.http.routers.myslots-secured.entrypoints=https \
  -l traefik.http.routers.myslots-secured.tls=true \
  -l traefik.http.routers.myslots-secured.tls.certResolver=sample \
  -l traefik.enable=true \
  --network web \
  --name myslots.club \
  --rm \
  docker.pkg.github.com/abendigo/myslots.club/myslots.club:67e9df097201ef44768686af892e0f6a9236448b
