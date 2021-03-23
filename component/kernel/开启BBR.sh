
# 升级内核至 4+

# 写入配置
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf


# 保存并生效
sysctl -p

# 查看是否开启。返回值有 tcp_bbr 模块即说明 bbr 已启动。
lsmod | grep bbr
