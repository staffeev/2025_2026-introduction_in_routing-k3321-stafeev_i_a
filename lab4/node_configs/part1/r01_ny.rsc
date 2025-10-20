/interface bridge
add name=loopback


/ip address
add address=10.0.56.6/24 interface=ether2
add address=192.168.20.1/24 interface=loopback
add address=6.6.6.6/32 interface=loopback


/routing ospf instance
set [find default=yes] router-id=6.6.6.6
set 0 redistribute-connected=as-type-1
/routing ospf network
add area=backbone network=10.0.56.0/24
add area=backbone network=6.6.6.6/32


/routing bgp instance
set default as=65000 router-id=6.6.6.6
/routing bgp network
add network=6.6.6.6/32
/routing bgp peer
add name=peer_LND remote-address=5.5.5.5 remote-as=65000 instance=default update-source=loopback


/ip pool
add name=dhcp_ny_pool ranges=192.168.60.100-192.168.60.254

/ip dhcp-server network
add address=192.168.60.0/24 gateway=192.168.60.1

/ip dhcp-server
add address-pool=dhcp_ny_pool disabled=no interface=loopback name=dhcp_ny

/system identity
set name=R_NY

/user
add name=staffeev password=strongpassword group=full
remove admin