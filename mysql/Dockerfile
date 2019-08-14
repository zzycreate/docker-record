FROM mysql:8

# 设置免密登录,用于后续执行sql
ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

# 文件存入容器
COPY setup.sh /mysql/setup.sh
COPY privileges.sql /mysql/privileges.sql

CMD ["sh", "/mysql/setup.sh"]
