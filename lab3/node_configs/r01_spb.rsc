/interface bridge
add name=loopback


/ip address
add address=10.0.12.1/24 interface=ether2
add address=10.0.13.1/24 interface=ether3
add address=192.168.10.1/24 interface=ether4
add address=1.1.1.1/24 interface=loopback


/routing ospf instance
set [find default=yes] router-id=1.1.1.1
set 0 redistribute-connected=as-type-1
/routing ospf network
add area=backbone network=10.0.13.0/24
add area=backbone network=10.0.12.0/24


/ip pool
add name=dhcp_spb_pool ranges=192.168.10.100-192.168.10.254
/ip dhcp-server network
add address=192.168.10.0/24 gateway=192.168.10.1
/ip dhcp-server
add address-pool=dhcp_spb_pool disabled=no interface=ether4 name=dhcp_spb


/system identity
set name=R_SPB
/user
add name=staffeev password=strongpassword group=full
remove admin