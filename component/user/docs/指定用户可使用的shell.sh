
# 查看可使用的shell
cat /etc/shells

# 指定 c332030 可使用 /bin/sh
# chsh -s /bin/sh c332030
# usermod -s /bin/sh abc
usermod -s /bin/bash c332030

# 切换目录
su c332030