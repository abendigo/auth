docker run -d \
  -l traefik.http.routers.grafana.rule="Host(\`test.freeroll.org\`)" \
  -l traefik.http.routers.grafana.entrypoints=http \
  -l traefik.http.routers.grafana.middlewares=redirect@file \
  -l traefik.http.routers.grafana-secured.rule="Host(\`test.freeroll.org\`)" \
  -l traefik.http.routers.grafana-secured.entrypoints=https \
  -l traefik.http.routers.grafana-secured.tls=true \
  -l traefik.http.routers.grafana-secured.tls.certResolver=sample \
  -l traefik.http.services.grafana.loadbalancer.server.port=3000 \
  -l traefik.enable=true \
  --network web \
  --name grafana \
  --rm \
  grafana/grafana

