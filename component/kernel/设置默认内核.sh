
#使用cat /boot/grub2/grub.cfg | grep menuentry  查看系统可用内核
cat /boot/grub2/grub.cfg | grep menuentry
cat /boot/efi/EFI/centos/grub.cfg | grep menuentry

if [ x"${feature_menuentry_id}" = xy ]; then
  menuentry_id_option="--id"
  menuentry_id_option=""
export menuentry_id_option
menuentry 'CentOS Linux (3.10.0-514.16.1.el7.x86_64) 7 (Core)' --class centos --class gnu-linux --class gnu --class os --unrestricted $menuentry_id_option 'gnulinux-3.10.0-327.el7.x86_64-advanced-6f5840d0-55ac-4d3b-899b-61c0297c5347' {
menuentry 'CentOS Linux (3.10.0-327.el7.x86_64) 7 (Core)' --class centos --class gnu-linux --class gnu --class os --unrestricted $menuentry_id_option 'gnulinux-3.10.0-327.el7.x86_64-advanced-6f5840d0-55ac-4d3b-899b-61c0297c5347' {
menuentry 'CentOS Linux (0-rescue-d57307c454c0437d91c309347178cdf5) 7 (Core)' --class centos --class gnu-linux --class gnu --class os --unrestricted $menuentry_id_option 'gnulinux-0-rescue-d57307c454c0437d91c309347178cdf5-advanced-6f5840d0-55ac-4d3b-899b-61c0297c5347' {

#查看当前内核
uname -r

3.10.0-514.16.1.el7.x86_64

#修改开机时默认使用的内核
grub2-set-default 'CentOS Linux (3.10.0-327.el7.x86_64) 7 (Core)'

#查看内核修改结果
grub2-editenv list
saved_entry=CentOS Linux (3.10.0-327.el7.x86_64) 7 (Core)

#查看系统安装了哪些内核包
rpm -qa | grep kernel

kernel-3.10.0-327.el7.x86_64
kernel-headers-3.10.0-514.6.1.el7.x86_64
kernel-tools-libs-3.10.0-327.el7.x86_64
kernel-3.10.0-514.16.1.el7.x86_64
kernel-tools-3.10.0-327.el7.x86_64

#使用yum remove 或rpm -e 删除无用内核，不能是当前使用的
yum remove kernel-3.10.0-327.el7.x86_64
