package redis;

import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.JedisCluster;

import java.util.HashSet;
import java.util.Set;

public class Main {
    public static void main (String[] args) {
        Set<HostAndPort> jedisClusterNodes = new HashSet<HostAndPort>();
        jedisClusterNodes.add(new HostAndPort("localhost", 7005));
        JedisCluster jedis = new JedisCluster(jedisClusterNodes);
        System.out.println(jedis.getClusterNodes().keySet());
        jedis.set("planets", "Mars");
        System.out.println(jedis.get("planets"));
    }
}
