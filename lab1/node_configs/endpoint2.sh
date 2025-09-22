#!/bin/sh
apk add --no-cache openssh
adduser staffeev
passwd strongpassword
/etc/init.d/sshd start


ip link set eth1 up
udhcpc -i eth1 -q
udhcpc -i eth1 -q

ip route add 10.100.0.0/24 via 10.200.0.1 dev eth1