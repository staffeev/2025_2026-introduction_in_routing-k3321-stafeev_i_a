/interface bridge
add name=loopback


/ip address
add address=10.0.56.6/24 interface=ether2
add address=192.168.60.1/24 interface=ether3
add address=10.10.255.6/32 interface=loopback


/ip pool
add name=dhcp_ny_pool ranges=192.168.60.100-192.168.60.254
/ip dhcp-server network
add address=192.168.60.0/24 gateway=192.168.60.1
/ip dhcp-server
add address-pool=dhcp_ny_pool disabled=no interface=ether3 name=dhcp_ny


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
add name=vrf_bridge
/ip address
add address=10.255.255.6/32 interface=vrf_bridge
/routing bgp instance vrf
add routing-mark=VRF_DEVOPS redistribute-connected=yes
/ip route vrf
add routing-mark=VRF_DEVOPS interfaces=vrf_bridge export-route-targets=65531:101 import-route-targets=65531:101 route-distinguisher=65531:1


/system identity
set name=R_NY
/user
add name=staffeev password=strongpassword group=full
remove admin