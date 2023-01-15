cd /home/ec2-user/demo &&
#linux aws
docker-compose -f docker-compose-vm.yml pull
docker-compose -f docker-compose-vm.yml stop
docker-compose -f docker-compose-vm.yml rm -f
docker-compose -f docker-compose-vm.yml build
#ubuntu aws
#docker compose -f docker-compose-vm.yml pull
#docker compose -f docker-compose-vm.yml stop
#docker compose -f docker-compose-vm.yml rm -f
#docker compose -f docker-compose-vm.yml build