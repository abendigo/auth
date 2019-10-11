docker run -d \
  -l traefik.http.routers.auth.rule="Host(\`auth.freeroll.org\`)" \
  -l traefik.http.routers.auth.entrypoints=http \
  -l traefik.http.routers.auth.middlewares=redirect \
  -l traefik.http.routers.auth-secured.rule="Host(\`auth.freeroll.org\`)" \
  -l traefik.http.routers.auth-secured.entrypoints=https \
  -l traefik.http.routers.auth-secured.tls=true \
  -l traefik.http.routers.auth-secured.tls.certResolver=sample \
  -l traefik.http.routers.auth-secured.service=auth \
  -l traefik.http.services.auth.loadbalancer.server.port=3000 \
  -l traefik.enable=true \
  --network web \
  --name auth \
  --rm \
  docker.pkg.github.com/abendigo/auth/auth:latest