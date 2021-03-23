
# nfs

## 远程挂载

安装
```shell script
yum install nfs-utils nfs-utils-lib -y
```

配置
```shell script
echo >> /etc/exports

# 只读
echo "/home/work/resources *(ro,sync,all_squash,no_subtree_check,no_root_squash)" >> /etc/exports
echo "/data/eleccard *(ro,sync,all_squash,no_subtree_check,no_root_squash)" >> /etc/exports

# 读写
echo "/home *(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports

# 全部挂载或卸载
exportfs -a

# 重新读取/etc/exports 中的信息 ，并同步更新/etc/exports、/var/lib/nfs/xtab
exportfs -r
```

启动服务
```shell script
service nfs start
service rpcbind start

service nfs restart
service rpcbind restart

systemctl enable nfs
systemctl enable rpcbind
```

查看错误日志
```shell script
cat /var/log/messages | grep mount
```

客户端挂载
```shell script
mount -t nfs 192.168.1.2:/home/work /home/program/nginx/html/sit/
mount -t nfs 192.168.1.2:/data /home/work

# 记得重启 nginx
```

windows 挂载
```cmd
mount -o mtype=hard nolock timeout=6 casesensitive=yes fileaccess=6 \\192.168.1.3\home k:
```


客户端取消挂载
```shell script
umount /home/program/nginx/html/sit/
```

## exports 属性
- ro

    该主机对该共享目录有只读权限

- rw

    该主机对该共享目录有读写权限

- root_squash

    客户机用root用户访问该共享文件夹时，将root用户映射成匿名用户

- no_root_squash

    客户机用root访问该共享文件夹时，不映射root用户

- all_squash

    客户机上的任何用户访问该共享目录时都映射成匿名用户

- anonuid

    将客户机上的用户映射成指定的本地用户ID的用户

- anongid

    将客户机上的用户映射成属于指定的本地用户组ID

- sync

    资料同步写入到内存与硬盘中

- async

    资料会先暂存于内存中，而非直接写入硬盘

- insecure

    允许从这台机器过来的非授权访问

- no_subtree_check

    即使输出目录是一个子目录，nfs服务器也不检查其父目录的权限，这样可以提高效率
