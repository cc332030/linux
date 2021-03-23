
# yum

搜索包
```shell script
yum search lrzsz
```

搜索包文件
```shell script
yum provides '*/applydeltarpm'
```


1.列出任何可更新的软件清单
```shell script
yum check-update
```

2.安装任何更新软件
```shell script
yum update
```

3.仅安装指定的软件
```shell script
yum install ***
```

4.仅更新指定的软件
```shell script
yum update ***
```

6.用YUM删除软件包
```shell script
yum remove ***
```

5.列出任何可安裝的软件清单
```shell script
yum list
```

3.列出任何可更新的软件包
yum list updates

4.列出任何已安装的软件包
yum list installed

5.列出任何已安装但不在 Yum Repository 內的软件包
yum list extras

6.列出所指定的软件包
yum list ***


7.使用YUM获取软件包信息
yum info ***

8.列出任何软件包的信息
yum info

9.列出任何可更新的软件包信息
yum info updates

10.列出任何已安裝的软件包信息
yum info installed

11.列出任何已安裝但不在 Yum Repository 內的软件包信息
yum info extras

12.列出软件包提供哪些文档
yum provides





1.清除缓存目录(/var/cache/yum)下的软件包
yum clean packages

2.清除缓存目录(/var/cache/yum)下的 headers
yum clean headers

3.清除缓存目录(/var/cache/yum)下旧的 headers
yum clean oldheaders

4.清除缓存目录(/var/cache/yum)下的软件包及旧的headers
yum clean, yum clean all (= yum clean packages; yum clean oldheaders).

