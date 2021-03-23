
# 模糊匹配路径及文件名，如 log*/*.log
find /home/work -path '*/log*/*[_|.]log*' -mtime +15 -exec rm -f {} \;

# 为避免删除文件引起的悲剧，把匹配的文件打印出来
find /home/work -path '*/log*/*[_|.]log*' -mtime +15 -exec echo {} \;


# 模糊匹配文件名
find . -mtime +15 -name "*.log.*" -exec rm -f {} \;
find . -mtime +7 -name "*[_|.]log.*" -exec rm -f {} \;
