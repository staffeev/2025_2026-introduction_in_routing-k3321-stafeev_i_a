/interface bridge
add name=loopback


/ip address
add address=10.0.12.1/24 interface=ether2
add address=192.168.10.1/24 interface=loopback
add address=1.1.1.1/32 interface=loopback


/routing ospf instance
set [find default=yes] router-id=1.1.1.1
set 0 redistribute-connected=as-type-1
/routing ospf network
add area=backbone network=10.0.12.0/24
add area=backbone network=1.1.1.1/32


/routing bgp instance
set default as=65000 router-id=1.1.1.1
/routing bgp network
add network=1.1.1.1/32
/routing bgp peer
add name=peer_HKI remote-address=2.2.2.2 remote-as=65000 instance=default update-source=loopback



/ip pool
add name=dhcp_spb_pool ranges=192.168.10.100-192.168.10.254
/ip dhcp-server network
add address=192.168.10.0/24 gateway=192.168.10.1
/ip dhcp-server
add address-pool=dhcp_spb_pool disabled=no interface=loopback name=dhcp_spb


/system identity
set name=R_SPB
/user
add name=staffeev password=strongpassword group=full
remove admin