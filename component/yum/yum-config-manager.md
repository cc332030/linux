
# yum 配置管理
yum-config-manager

配置地址
```shell script
cd /etc/yum.repos.d/
```

## 添加源
```shell script
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

```

## 查询源
```shell script
# 显示所有启动的仓库
yum repolist enabled

# 显示所有禁用的仓库
yum repolist disabled

# 显示所有仓库
yum repolist all
```

## 启用停用
```shell script
yum-config-manager --enable repository
yum-config-manager --disable repository
```
