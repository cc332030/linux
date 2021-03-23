
# firewall problem

## docker 无法访问内网 Host is unreachable
firewall 添加 docker 网段信任
```shell script

firewall-cmd --reload

firewall-cmd --zone=trusted --list-sources

firewall-cmd --zone=trusted --add-source=172.17.0.0/16 --permanent

firewall-cmd --zone=trusted --remove-source=172.17.0.0/16 --permanent

```

## 无法访问内网 未测试
添加HTTP服务到内部区域（internal）
```shell script
firewall-cmd --permanent --zone=internal --add-service=http
firewall-cmd --reload
```
