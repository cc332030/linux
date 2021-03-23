
# 日志分割工具

```shell script
vi /etc/logrotate.d/nginx-access

chcon -Rv --type=var_log_t /home/program/nginx/logs
```

手动执行
```shell script
logrotate -vf /etc/logrotate.d/nginx
```

测试规则执行结果
```shell script
logrotate -vdf /etc/logrotate.conf

logrotate -vdf /etc/logrotate.d/nginx
```

自身日志路径
```shell script
less /var/lib/logrotate/logrotate.status
less /var/lib/logrotate/status
```

## 计划任务
> /etc/anacrontab
