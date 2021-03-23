
$sudo vim /usr/sbin/update-grub 
#!/bin/sh
set -e
exec grub2-mkconfig -o /boot/grub2/grub.cfg "$@"
$sudo chmod + x /usr/sbin/update-grub
$sudo update-grub

#思路就是这样，嫌麻烦可以直接用 $sudo grub2-mkconfig -o /boot/grub2/grub.cfg