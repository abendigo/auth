docker run -d \
  -l traefik.http.routers.webhooks-secured.rule="Host(\`webhooks.oosterveld.org\`)" \
  -l traefik.http.routers.webhooks-secured.entrypoints=https \
  -l traefik.http.routers.webhooks-secured.tls=true \
  -l traefik.http.routers.webhooks-secured.tls.certResolver=sample \
  -l traefik.enable=true \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $PWD/config:/usr/src/service/config \
  --network web \
  --name webhooks \
  --rm \
  docker.pkg.github.com/abendigo/webhooks/webhooks
