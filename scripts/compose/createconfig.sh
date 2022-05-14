basepath=$(pwd)
for port in $(seq 1 6); \
do \
mkdir -p ./node-${port}/conf
mkdir -p ./node-${port}/data
touch ./node-${port}/conf/redis.conf
 echo ${port}
sed -e "s/cluster-announce-ip 10.0.0.1/cluster-announce-ip 10.0.0.1${port}/" redis.conf > ./node-${port}/conf/redis.conf

chown -R redis-docker-root:redis-docker-root ${basepath}/node-${port}
chown -R redis-docker-user:redis-docker-root ${basepath}/node-${port}/data
done
ls
diff node-1/conf/redis.conf node-2/conf/redis.conf
