/interface bridge
add name=loopback


/ip address
add address=10.0.56.5/24 interface=ether2
add address=10.0.25.5/24 interface=ether3
add address=10.0.35.5/24 interface=ether3
add address=10.10.255.5/32 interface=loopback network=10.10.255.5


/routing ospf instance
set [find default=yes] router-id=10.10.255.5
/routing ospf network
add area=backbone network=10.0.25.0/24
add area=backbone network=10.0.35.0/24
add area=backbone network=10.0.56.0/24
add area=backbone network=10.10.255.5/32


/mpls ldp
set enabled=yes lsr-id=10.10.255.5 transport-address=10.10.255.5
/mpls ldp interface
add interface=ether2
add interface=ether3
add interface=ether4


/routing bgp instance
set default as=65531 router-id=10.10.255.5
/routing bgp network
add network=10.10.255.0/24
/routing bgp peer
add name=peer_NY remote-address=10.10.255.6 remote-as=65531 address-families=l2vpn,vpnv4 instance=default update-source=loopback
add name=peer_HKI remote-address=10.10.255.2 remote-as=65531 address-families=l2vpn,vpnv4 instance=default update-source=loopback route-reflect=yes
add name=peer_LBN remote-address=10.10.255.3 remote-as=65531 address-families=l2vpn,vpnv4 instance=default update-source=loopback route-reflect=yes


/system identity
set name=R_LND

/user
add name=staffeev password=strongpassword group=full
remove admin