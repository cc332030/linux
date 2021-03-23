
# rpm

安装
```shell script
rpm -ivh MySQL-5.6.41-1.el6.src.rpm

cd ~/rpmbuild/SPECS/ 
rpmbuild -ba mysql.spec 



rpmbuild --rebuild --clean MySQL-5.6.41-1.el6.src.rpm --nodeps --force

rpm -ivh mysql-community-client-5.7.13-1.el7.x86_64.rpm --nodeps --force

```
