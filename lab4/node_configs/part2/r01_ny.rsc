/interface bridge
add name=loopback


/ip address
add address=10.0.56.6/24 interface=ether2
add address=192.168.60.1/24 interface=ether3
add address=10.10.255.6/32 interface=loopback


/routing ospf instance
set [find default=yes] router-id=10.10.255.6
set 0 redistribute-connected=as-type-1
/routing ospf network
add area=backbone network=10.0.56.0/24
add area=backbone network=10.10.255.6/32


/mpls ldp
set enabled=yes lsr-id=10.10.255.6 transport-address=10.10.255.6
/mpls ldp interface
add interface=ether2
add interface=ether3


/routing bgp instance
set default as=65531 router-id=10.10.255.6
/routing bgp network
add network=10.10.255.0/24
/routing bgp peer
add name=peer_LND remote-address=10.10.255.5 remote-as=65531 address-families=l2vpn,vpnv4 instance=default update-source=loopback


/interface bridge
add name=vpls_bridge
/interface bridge port
add bridge=vpls_bridge interface=ether3
/ip address
add address=10.255.255.6/32 interface=vpls_bridge
/interface vpls bgp-vpls
add bridge=vpls_bridge site-id=6 route-distinguisher=65531:1 import-route-targets=65531:101 export-route-targets=65531:101


/ip pool
add name=dhcp_vpls_pool ranges=20.0.0.100-20.0.0.254
/ip dhcp-server network
add address=20.0.0.0/24 gateway=20.0.0.1
/ip dhcp-server
add address-pool=dhcp_vpls_pool disabled=no interface=vpls_bridge name=dhcp_vpls


/system identity
set name=R_NY
/user
add name=staffeev password=strongpassword group=full
remove admin