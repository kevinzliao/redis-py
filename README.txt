
to run:

docker run --name kevin-redis -d -v ${pwd}:/data -p 6379:6379 redis:5.0 redis-server --appendonly yes

command line (while container is running):
docker exec -it kevin-redis redis-cli

if you are running the redis container to be accessed by python, you'll need to create a network (or use docker-compose)

docker network create redis-network

docker network connect redis-network kevin-redis

docker run --net redis-network --rm -it --entrypoint 'python' redis_docker


in the .py script you'll need to specify host as kevin-redis (host name is container name)
import redis

db = redis.Redis(host='kevin-redis')