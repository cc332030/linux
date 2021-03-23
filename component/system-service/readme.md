
# 系统服务

## 软链接
```shell script
ln -s /app/funda/funda.jar /etc/init.d/funda
```

服务如果是脚本，需要加这两行
# chkconfig: - 85 15
# description: etcd


服务添加到 chkconfig 管理列表
chkconfig --add nginx
chkconfig --add /etc/init.d/nginx

设置自启动
chkconfig nginx on

## 查看软链接
```shell script
ls -l /etc/init.d/funda
```

## 启动服务
```shell script
service funda start
```

## 查看应用运行状态
```shell script
service funda status
```

## 停止应用
```shell script
service funda stop
```
