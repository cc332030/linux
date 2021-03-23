
# 添加
dd if=/dev/zero of=/home/.swap bs=1M count=16384

# 格式化
mkswap /home/.swap

# 启用
swapon /home/.swap

# 禁用
swapoff /home/.swap

# 开机自启动
vi /etc/fstab
/home/.swap swap swap defaults 0 0


# swappiness=0 的时候表示最大限度使用物理内存，然后才是 swap空间
# swappiness＝100 的时候表示积极的使用swap分区
cat /proc/sys/vm/swappiness

# 永久设置
vi /etc/sysctl.conf
# vm.swappiness=10

# 临时设置
sysctl vm.swappiness=10
