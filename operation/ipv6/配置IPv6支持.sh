
ifconfig sit0 up
ifconfig sit0 inet6 tunnel ::66.220.18.42
ifconfig sit1 up
ifconfig sit1 inet6 add 2001:470:c:557::2/64
route -A inet6 add ::/0 dev sit1


modprobe ipv6
ip tunnel add he-ipv6 mode sit remote 66.220.18.42 local 144.34.162.25 ttl 255
ip link set he-ipv6 up
ip addr add 2001:470:c:557::2/64 dev he-ipv6
ip route add ::/0 dev he-ipv6
ip -f inet6 addr
