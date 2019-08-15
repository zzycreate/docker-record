# Redis

## 安装 redis

### 1. 获取 redis 的镜像

```
docker pull redis
```

### 2. redis的配置修改

复制 [http://download.redis.io/redis-stable/redis.conf](http://download.redis.io/redis-stable/redis.conf) 地址里面redis.conf 配置存储并修改其中的配置。

其中 requirepass 是 redis 的密码; daemonize yes 千万要注释掉，不然起不来docker容器。

配置文件放在 `E:\docker_data\redis\data\conf`, 便于运行时加载

### 3. 运行 redis 容器

执行命令：

```
docker run --name local-redis -v E:\docker_data\redis\data:/data --restart=always --privileged=true -p 6379:6379 -d redis redis-server /data/conf/redis.conf
```

`--restart=always` : docker启动后服务也会启动
`-v E:\docker_data\redis\data:/data` : 数据挂在，其中 `conf/redis.conf` 是 redis 服务启动时使用的配置
`--privileged=true` : 

### 4. 校验 redis 连接

执行以下命令，使用之前运行好的容器 local-redis 中的 redis-cli 客户端工具连接服务测试，在 redis 交互命令行中输入 `auth 密码` 校验密码是否正确，启动容器的密码在上述 ` /data/conf/redis.conf` 中。

```
docker exec -it local-redis redis-cli -h localhost -p 6379
```

