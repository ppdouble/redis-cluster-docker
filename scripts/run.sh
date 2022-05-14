basepath="/home/data/cluster"
for port in $(seq 1 6); \
do \
    docker run --publish 637${port}:6379 --publish 1637${port}:16379 --name redis-node-${port} \
        --volume ${basepath}/redis/node-${port}/data:/data \
        --volume ${basepath}/redis/node-${port}/conf/redis.conf:/etc/redis/redis.conf \
        --detach --net redis-net --ip 172.28.0.1${port} redis:6.2 redis-server /etc/redis/redis.conf
done

docker ps -a | grep redis-node
#查找ip
for port in `seq 1 6`;
do
	echo -n "$(docker inspect --format '{{ (index .NetworkSettings.Networks "redis-net").IPAddress }}' "redis-node-${port}")":637${port}" ";
done
