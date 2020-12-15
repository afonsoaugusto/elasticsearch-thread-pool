# elasticsearch-thread-pool

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

```bash
sudo systemctl start docker
docker swarm init --advertise-addr 192.168.100.8

docker stack deploy --prune -c docker-compose.yml stackdemo

docker stack services stackdemo
docker stack rm stackdemo


docker service ls
docker service ps --no-trunc y2yrwrn1irn9

#logs
docker service logs service_name

docker service update --force stackdemo_api-uuid
docker service update --force stackdemo_elasticsearch; \
docker service update --force stackdemo_kibana


docker stack rm stackdemo $(docker service ls -q)
docker stop $(docker ps -a -q)
docker container rm $(docker container ls -aq)
docker volume rm $(docker volume ls -q)
```

- sysctl -w vm.max_map_count=262144
- echo 'vm.max_map_count=262144' >> /etc/sysctl.conf (to persist reboots)

```bash
export VERSION=v0.38.5 # use the latest release version from https://github.com/google/cadvisor/releases
sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8080:8080 \
  --detach=false \
  --name=cadvisor \
  --privileged \
  --device=/dev/kmsg \
  gcr.io/cadvisor/cadvisor:$VERSION
```

## Workshop elasticsearch
