/interface bridge
add name=loopback


/ip address
add address=10.0.12.1/24 interface=ether2
add address=10.0.13.1/24 interface=ether3
add address=192.168.10.1/24 interface=loopback
add address=1.1.1.1/32 interface=loopback


/routing ospf instance
set [find default=yes] router-id=1.1.1.1
set 0 redistribute-connected=as-type-1
/routing ospf network
add area=backbone network=10.0.13.0/24
add area=backbone network=10.0.12.0/24
add area=backbone network=1.1.1.1/32


/mpls ldp
set enabled=yes lsr-id=1.1.1.1 transport-address=1.1.1.1
/mpls ldp interface
add interface=ether2
add interface=ether3


/interface vpls
add name=eompls_to_NY remote-peer=6.6.6.6 vpls-id=100:1 disabled=no


/interface bridge port
add bridge=loopback interface=ether4
add bridge=loopback interface=eompls_to_NY


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