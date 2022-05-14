
1. using `docker run` to create cluster
first using `createconfig.sh` to create configuration file for each container. modify owner of the configuration file

2. scripts in `compose` folder is used for `docker-compose` to create redis cluster

Notes:

In my case, users in redis 6.2 container is as follow:

| | container | root | redis |
| -- | -- | -- | -- |
| container | id| 0 | 999 |
| host | id | 100000 | 100999 |

`root` with id `0` in container has id `100000` in host.

So I set user name for id `100000` in host.

```bash
[hostuser@host-machine]$ sudo groupadd -g 100000 redis-docker-root
[hostuser@host-machine]$ sudo groupadd -g 100999 redis-docker-user
[hostuser@host-machine]$ sudo useradd -u 100000 -g redis-docker-root redis-docker-root
[hostuser@host-machine]$ sudo useradd -u 100999 -g redis-docker-user redis-docker-user
```
