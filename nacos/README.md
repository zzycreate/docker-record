# Nacos

## 部署

1. 准备mysql数据库，创建数据库(`CREATE DATABASE  `wordpress` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;`), 执行官方sql [nacos-db.sql](https://github.com/alibaba/nacos/blob/master/config/src/main/resources/META-INF/nacos-db.sql)

2. standalone 方式启动nacos，执行以下命令

```
 docker run -e MODE=standalone -e MYSQL_MASTER_SERVICE_HOST=127.0.0.1 -e MYSQL_MASTER_SERVICE_DB_NAME=nacos -e MYSQL_MASTER_SERVICE_USER=root -e MYSQL_MASTER_SERVICE_PASSWORD=123456 -v E:\docker_data\nacos\conf:/home/nacos/conf --name local-nacos -d -p 8848:8848 nacos/nacos-server
```

其中 -e 的参数主要是数据库的配置，-v 绑定本地的配置，容器原始的三个配置见本目录的conf下的三个文件 `application.properties`、`nacos-logback.xml`、`schema.sql`。

3. 打开 nacos 地址：[http://localhost:8848/nacos](http://localhost:8848/nacos)
