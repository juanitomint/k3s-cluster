#/bin/sh
echo "remove docker compose"
docker-compose down
echo "Deleting persistence Volume"
docker volume rm k3s_k3s-server