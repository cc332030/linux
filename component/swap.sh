
SWAP_PATH=/swap
SIZE=2048

# 添加
dd if=/dev/zero of=${SWAP_PATH} bs=1M count=${SIZE}
chmod 0600 ${SWAP_PATH}

# 格式化
mkswap ${SWAP_PATH}

# 启用
swapon ${SWAP_PATH}

# 禁用
swapoff ${SWAP_PATH}

# 开机自启动
echo "${SWAP_PATH} swap swap defaults 0 0" |  tee -a /etc/fstab

# swappiness=0 的时候表示最大限度使用物理内存，然后才是 swap空间
# swappiness＝100 的时候表示积极的使用swap分区
cat /proc/sys/vm/swappiness

# 永久设置
vi /etc/sysctl.conf
# vm.swappiness=10

# 临时设置
sysctl vm.swappiness=10
