# Portainer

Portainer是一个轻量级的管理界面，可以让您轻松地管理不同的Docker环境（Docker主机或Swarm集群）。Portainer提供状态显示面板、应用模板快速部署、容器镜像网络数据卷的基本操作、事件日志显示、容器控制台操作、Swarm集群和服务等集中管理和操作、登录用户管理和控制等功能。功能十分全面，基本能满足中小型单位对容器管理的全部需求。

## 相关链接

1. [Portainer GitHub: https://github.com/portainer/portainer](https://github.com/portainer/portainer)
2. [Portainer Deployment: https://portainer.readthedocs.io/en/latest/deployment.html](https://portainer.readthedocs.io/en/latest/deployment.html)

## 本地部署

### Windows 部署

创建 `E:\docker_data\portainer` 目录做 portainer 的本地数据卷。容器内，portainer 的数据存储在 `/data` 下。

```bash
docker run -d -p 9000:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v E:\docker_data\portainer:/data portainer/portainer
```

如果 docker-desktop 使用的是 Windows 容器内核，则使用下列命令：

```
docker run -d -p 9000:9000 --name portainer --restart always -v \\.\pipe\docker_engine:\\.\pipe\docker_engine -v E:\docker_data\portainer:C:\data portainer/portainer
```

部署成功后登录 `localhost:9000` 可以访问 portainer 的网站。
