/interface bridge
add name=loopback


/ip address
add address=10.0.46.6/24 interface=ether2
add address=10.0.56.6/24 interface=ether3
add address=192.168.20.1/24 interface=ether4
add address=6.6.6.6/24 interface=loopback


/routing ospf area
add name=area_us area-id=0.0.0.1
/routing ospf instance
set [find default=yes] router-id=6.6.6.6
set 0 redistribute-connected=as-type-1
/routing ospf network
add area=area_us network=10.0.46.0/24
add area=area_us network=10.0.56.0/24

/ip pool
add name=dhcp_ny_pool ranges=192.168.20.100-192.168.20.254

/ip dhcp-server network
add address=192.168.20.0/24 gateway=192.168.20.1

/ip dhcp-server
add address-pool=dhcp_ny_pool disabled=no interface=ether4 name=dhcp_ny

/system identity
set name=R_NY

/user
add name=staffeev password=strongpassword group=full
remove admin