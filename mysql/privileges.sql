use mysql;

-- 设置密码, 添加远程权限，修改为 mysql_native_password 加密方式
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';

-- 刷新权限
FLUSH privileges;
