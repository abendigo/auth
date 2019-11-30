docker run -d \
  -l traefik.http.routers.myslots-secured.rule="Host(\`myslots.club\`)" \
  -l traefik.http.routers.myslots-secured.entrypoints=https \
  -l traefik.http.routers.myslots-secured.tls=true \
  -l traefik.http.routers.myslots-secured.tls.certResolver=sample \
  -l traefik.enable=true \
  --network web \
  --name myslots.club \
  --rm \
  docker.pkg.github.com/abendigo/myslots.club/myslots.club
