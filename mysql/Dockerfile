FROM mysql:8

# 设置密码，用于执行后续sql，在privileges.sql中设置真正的密码
ENV MYSQL_ROOT_PASSWORD 123456

# 文件存入容器
COPY setup.sh /mysql/setup.sh
COPY privileges.sql /mysql/privileges.sql

CMD ["sh", "/mysql/setup.sh", "${MYSQL_ROOT_PASSWORD}"]
