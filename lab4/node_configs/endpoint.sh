#!/bin/sh

ip link set eth1 up
# udhcpc -i eth1 -q

ip route del default via 172.50.0.1 dev eth0