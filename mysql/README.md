# Mysql

## mysql 镜像

[官方镜像地址：https://hub.docker.com/_/mysql/](https://hub.docker.com/_/mysql/)

执行以下命令拉取 mysql 镜像：

```bash
docker pull mysql
docker pull mysql:latest
docker pull mysql:8
docker pull mysql:5.7
```

## mysql 部署

创建本地目录卷：

- `E:\docker_data\mysql\conf`: 目录里的配置文件将映射为mysql容器的配置文件, 替换容器内 `/etc/mysql/conf.d` 目录
- `E:\docker_data\mysql\data`: 将映射为mysql容器配置的数据文件存放路径， 绑定容器内 `/var/lib/mysql` 目录，将mysql的数据存储在本地，避免容器销毁后数据库数据也消失了。
- `E:\docker_data\mysql\logs`: 将映射为mysql容器的日志目录, 绑定容器内 `/logs` 目录

其他常用的配置：

- `--name {container_name}`: 指定容器名称
- `-p 3306:3306`: 将容器内的3306端口（第二个参数）映射到本机的3306端口（第一个参数）
- `-e MYSQL_ROOT_PASSWORD=123456`: 设置 root 用户的密码

```
docker run --name local-mysql -p 3306:3306 -v E:\docker_data\mysql\conf:/etc/mysql/conf.d -v E:\docker_data\mysql\data:/var/lib/mysql -v E:\docker_data\mysql\logs:/logs -e MYSQL_ROOT_PASSWORD=123456 -d mysql:8 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci 
```

## mysql 部署后无法访问

mysql 部署完成之后可能不能直接访问，因此需要进入容器内设置远程访问权限。

### mysql8

mysql8的版本对加密规则进行了修改，mysql8 之前的版本中加密规则是mysql_native_password,而在mysql8之后,加密规则是caching_sha2_password, 所以需要把mysql用户登录密码加密规则还原成mysql_native_password. 

1. 执行命令 `docker exec -it local-mysql bash` 交互式的进入 mysql 容器内部。

2. 执行命令 `mysql -u root -p` 输入密码后进入 mysql 交互式命令行。

3. 执行sql `use mysql;` 使用 `mysql` 库。

4. 执行sql `ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';`。

5. 执行sql `flush privileges;` 刷新权限

### 其他添加远程操作权限方式

执行sql `update user set host='%' where user='root';`

### Dockerfile方式安装mysql8

1. 在当前目录执行 `docker build -t zzycreate/mysql .`，当前目录有 Dockerfile 和执行脚本，此命令会创建一个 image，用于下一步的容器创建。privileges.sql 会给root赋予 mysql_native_password 加密登录方式，设置密码，并赋予远程权限。

2. 执行以下命令直接运行上一步封装好的image：

```
docker run --name local-mysql -p 3306:3306 -v E:\docker_data\mysql\conf:/etc/mysql/conf.d -v E:\docker_data\mysql\data:/var/lib/mysql -v E:\docker_data\mysql\logs:/logs -d zzycreate/mysql --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci 
```
