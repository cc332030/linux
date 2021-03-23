
# cd /lib/systemd/system/
# vim nginx.service
# 执行systemctl enable nginx.service使nginx开机启动
systemctl enable nginx.service

[Unit]
Description=nginx
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/nginx/nginx
ExecReload=/usr/local/nginx/nginx -s reload
ExecStop=/usr/local/nginx/nginx quit
PrivateTmp=true

[Install]
WantedBy=multi-user.target


# docker 开机自启
# 使用ststemctl命令
systemctl enable docker

# 将Docker的docker.service服务移动到系统服务中

cp /usr/lib/systemd/system/docker.service /etc/systemd/system/
systemctl daemon-reload
systemctl restart docker

# 重启Docker后，会在/etc/systemd/system/multi-user.target.wants下自动生成符号链接
ll /etc/systemd/system/multi-user.target.wants/docker.service
