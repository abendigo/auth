docker run -d \
  -p 80:80 \
  -p 443:443 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $PWD/traefik.yml:/traefik.yml \
  -v $PWD/dynamic.yml:/dynamic.yml \
  -v $PWD/acme.json:/acme.json \
  --network web \
  --name traefik \
  --rm \
  traefik:2.0.0



