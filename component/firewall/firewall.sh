
# 防火墙

# 安装

yum install firewalld



# 服务管理

systemctl start firewalld
systemctl restart firewalld
systemctl stop firewalld

systemctl enable firewalld
systemctl disable firewalld


systemctl status firewalld



# 添加端口开放

firewall-cmd --zone=public --add-port=22/tcp --permanent

firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --zone=public --add-port=29971/tcp --permanent

# 批量添加
firewall-cmd --zone=public --add-port=100-500/tcp --permanent



# 配置重载

firewall-cmd --reload



# 查询端口开放

firewall-cmd --zone=public --list-ports

firewall-cmd --zone=public --query-port=80/tcp
firewall-cmd --zone=public --query-port=443/tcp
firewall-cmd --zone=public --query-port=29971/tcp



# 删除端口开放

firewall-cmd --zone=public --remove-port=22/tcp --permanent

# 批量删除

firewall-cmd --zone=public --remove-port=100-500/tcp --permanent



# 限制 ip 的 80 端口

firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address="192.168.0.200" port protocol="tcp" port="80" reject"

# 限制 ip 段的 80 端口
firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address="10.0.0.0/24" port protocol="tcp" port="80" reject"



# 查询限制 ip

firewall-cmd --zone=public --list-rich-rules



# 解除限制 ip 的 80 端口

firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address="192.168.0.200" port protocol="tcp" port="80" accept"

# 解除限制 ip 段的 80 端口

firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address="10.0.0.0/24" port protocol="tcp" port="80" accept"



# 查询开启的服务
firewall-cmd --list-services

# 查询所有服务
firewall-cmd --get-services


# 添加服务
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=ftp



# ip 限制配置文件

vi /etc/firewalld/zones/public.xml


# 端口转发，将到本机的3306端口的访问转发到192.168.1.1服务器的3306端口
# 开启伪装IP
firewall-cmd --permanent --add-masquerade
# 配置端口转发
firewall-cmd --permanent --add-forward-port=port=3306:proto=tcp:toaddr=192.168.1.2:toport=13306
