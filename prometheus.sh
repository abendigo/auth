docker run -d \
  -l traefik.http.routers.prometheus.rule="Host(\`freeroll.oosterveld.org\`)" \
  -l traefik.http.routers.prometheus.entrypoints=http \
  -l traefik.http.routers.prometheus.middlewares=redirect@file \
  -l traefik.http.routers.prometheus-secured.rule="Host(\`freeroll.oosterveld.org\`)" \
  -l traefik.http.routers.prometheus-secured.entrypoints=https \
  -l traefik.http.routers.prometheus-secured.tls=true \
  -l traefik.http.routers.prometheus-secured.tls.certResolver=sample \
  -l traefik.http.services.prometheus.loadbalancer.server.port=9090 \
  -l traefik.enable=true \
  -v $PWD/prometheus.yml:/etc/prometheus/prometheus.yml \
  --network web \
  --name prometheus \
  --rm \
  prom/prometheus

#  -l traefik.http.routers.prometheus.rule="Host(\`monitor.oosterveld.org\`) && Path(\`/prometheus\`)" \
