basepath="/home/data/cluster"
docker network create redis-net --subnet 172.28.0.0/16
for port in $(seq 1 6); \
do \
mkdir -p ./node-${port}/conf
mkdir -p ./node-${port}/data
touch ./node-${port}/conf/redis.conf
cat << EOF > ./node-${port}/conf/redis.conf
#端口 
port 6379
#非保护模式 
protected-mode no
#启用集群模式 
cluster-enabled yes
cluster-config-file nodes.conf
#超时时间 
cluster-node-timeout 15000
#集群各节点IP地址，记得修改为你的ip地址
cluster-announce-ip 172.28.0.1${port}
#集群节点映射端口 
cluster-announce-port 6379
#集群总线端口 
cluster-announce-bus-port 16379 
#开启aof持久化策略 
appendonly yes
#后台运行
#daemonize yes
#进程号存储
pidfile /var/run/redis_6379.pid
#外部访问
bind 0.0.0.0
#集群加密
#masterauth itheima
#requirepass itheima
EOF
cd ${basepath}/redis/
sudo chown -R redis-docker-root:redis-docker-root ${basepath}/redis/node-${port}
sudo chown -R redis-docker-user:redis-docker-root ${basepath}/redis/node-${port}/data
done
