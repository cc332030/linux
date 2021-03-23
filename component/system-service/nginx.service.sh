
# cd /lib/systemd/system/
# vim nginx.service

# 执行 systemctl enable nginx.service 使nginx开机启动

[Unit]
Description=nginx 
After=network.target 

[Service] 
Type=forking 
ExecStart=/usr/local/nginx/nginx
ExecReload=/usr/local/nginx/nginx -s reload
ExecStop=/usr/local/nginx/nginx -s quit
PrivateTmp=true 

[Install] 
WantedBy=multi-user.target
