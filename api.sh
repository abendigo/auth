docker run -d \
  -l traefik.http.routers.moz-secured.rule="Host(\`api.freeroll.org\`)" \
  -l traefik.http.routers.moz-secured.entrypoints=https \
  -l traefik.http.routers.moz-secured.tls=true \
  -l traefik.http.routers.moz-secured.tls.certResolver=sample \
  -l traefik.http.services.moz.loadbalancer.server.port=1234 \
  -l traefik.enable=true \
  -e ENVIRONMENT=staging \
  --network web \
  --name api \
  --rm \
  docker.pkg.github.com/abendigo/api/api
