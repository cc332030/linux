#1.查看系统当前内核版本:

uname -a
uname -r

# Linux localhost 2.6.18-274.18.1.el5 #1 SMP Thu Feb 9 12:45:52 EST 2012 i686 i686 i386 GNU/Linux

# 2.查看系统中全部的内核RPM包:
rpm -qa | grep kernel

# kernel-devel-2.6.18-194.el5
# kernel-devel-2.6.18-274.18.1.el5
# kernel-headers-2.6.18-274.18.1.el5
# kernel-2.6.18-194.el5
# kernel-2.6.18-274.18.1.el5


# 3.删除旧内核的RPM包

yum remove kernel-2.6.18-194.el5
yum remove kernel-devel-2.6.18-194.el5

# 4.重启系统

reboot