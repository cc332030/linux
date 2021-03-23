
# 设置时区
timedatectl set-timezone Asia/Hong_Kong

# 将硬件时钟调整为与本地时钟一致, 0 为设置为 UTC 时间
timedatectl set-local-rtc 1

# 列出所有时区
timedatectl list-timezones
