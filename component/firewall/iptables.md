
# 安装防火墙

安装
```shell script
yum install -y iptables
```

开启防火墙
```shell script
service iptables start
```

关闭防火墙
```shell script
service iptables stop
```

重启防火墙
```shell script
service iptables restart
```


状态
```shell script
service iptables status
```

加载ip_tables模块
```shell script
modprobe ip_tables
```

加载iptable_filter模块
```shell script
modprobe iptable_filter
```

启用防火墙
```shell script
chkconfig iptables on
```

停用防火墙
```shell script
chkconfig iptables off
```


禁止其他未指定的端口
```shell script
iptables -P INPUT ACCEPT
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
```


centos6
```shell script
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT

iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT

iptables -A INPUT -p tcp --dport 29378 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 29378 -j ACCEPT

iptables -A INPUT -p tcp --dport 6379 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 6379 -j ACCEPT

iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 3306 -j ACCEPT

iptables -A INPUT -p tcp --dport 8388 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 8388 -j ACCEPT

iptables -A INPUT -p udp --dport 2379 -j ACCEPT
iptables -A OUTPUT -p udp --sport 2379 -j ACCEPT
```


保存并重启防火墙
```shell script
/etc/rc.d/init.d/iptables save
/etc/init.d/iptables restart
```

查找所有规则
```shell script
iptables -L -n
iptables -L -n --line-number
iptables -L INPUT --line-numbers
/etc/init.d/iptables status
```

删除一条规则
```shell script
iptables -D INPUT 7
```








# centos7

启动防火墙
 
systemctl start firewalld.service

开启 80 443 端口

firewall-cmd --zone=public --add-port=22/tcp --permanent

firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent

firewall-cmd --zone=public --add-port=29378/tcp --permanent

firewall-cmd --reload


