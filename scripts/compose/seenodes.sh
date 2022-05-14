docker ps -a | grep redis-cluster
#查找ip
for port in `seq 1 6`;
do
	echo -n "$(docker inspect --format '{{ (index .NetworkSettings.Networks "mycomposeprj_redis-cluster-net").IPAddress }}' "redis-cluster-${port}")":700${port}" ";
done

