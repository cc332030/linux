
# rpm

# 安装
rpm -ivh jdk-8u144-linux-x64.rpm


# 可以查看安装的具体内容
rpm -ql +完整的包名
rpm -ql jdk1.8.0_144

# 卸载
rpm -e jdk1.8.0_144

# 更新
rpm -Uvh jdk1.8.0_144

# jdk安置位置为 /usr/java
