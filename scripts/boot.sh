cd /home/ec2-user/demo &&

aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 853192360440.dkr.ecr.us-west-2.amazonaws.com

docker volume prune -f &&
#COMPOSE_HTTP_TIMEOUT=200 
docker-compose -f docker-compose-vm.yml up -d
#ubuntu
#COMPOSE_HTTP_TIMEOUT=200 docker compose -f docker-compose-vm.yml up -d