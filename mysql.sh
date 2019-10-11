docker run -d \
  -l traefik.enable=false \
  --rm \
  --name apidb \
  --network web \
  -e MYSQL_ROOT_PASSWORD=password \
  -e MYSQL_PASSWORD=password \
  -e MYSQL_USER=marko \
  -v apidb:/var/lib/mysql \
  mysql:8
