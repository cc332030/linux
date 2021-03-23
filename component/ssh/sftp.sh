
# 连接
sftp c332030@192.168.128.1

# 安装
# 添加用户组
groupadd sftp
groupdel sftp

# 添加用户设为用户组
# -g 加入主要用户组
# -s 指定用户登录后所使用的shell
# -M 不要自动建立用户的登入目录
useradd -g sftp -s /sbin/nologin -M c332030
useradd -g sftp -s /sbin/nologin -M sftp

# 修改密码
passwd c332030

# 创建 SFTP 的根目录和属主目录，修改权限 755
mkdir /home/sftp
chown root:sftp /home/sftp
chmod 755 /home/sftp

# 修改 SSHD_CONFIG 的配置文件
vi /etc/sshd_config

# 重启 SSHD
systemctl restart sshd