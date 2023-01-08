
# 数据重定向
tee

## 数据写入到文件
```shell script
# -a 追加
tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://esjoty1m.mirror.aliyuncs.com"]
}
EOF
```
