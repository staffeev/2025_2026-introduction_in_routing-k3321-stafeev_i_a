/interface bridge
add name=loopback


/ip address
add address=10.0.34.3/24 interface=ether2
add address=10.0.23.3/24 interface=ether3
add address=10.0.35.3/24 interface=ether4
add address=10.10.255.3/32 interface=loopback network=10.10.255.3


/routing ospf instance
set [find default=yes] router-id=10.10.255.3
/routing ospf network
add area=backbone network=10.0.23.0/24
add area=backbone network=10.0.34.0/24
add area=backbone network=10.0.35.0/24
add area=backbone network=10.10.255.3/32


/mpls ldp
set enabled=yes lsr-id=10.10.255.3 transport-address=10.10.255.3
/mpls ldp interface
add interface=ether2
add interface=ether3
add interface=ether4


/routing bgp instance
set default as=65531 router-id=10.10.255.3
/routing bgp network
add network=10.10.255.0/24
/routing bgp peer
add name=peer_HKI remote-address=10.10.255.2 remote-as=65531 address-families=l2vpn,vpnv4 instance=default update-source=loopback route-reflect=yes
add name=peer_LND remote-address=10.10.255.5 remote-as=65531 address-families=l2vpn,vpnv4 instance=default update-source=loopback route-reflect=yes
add name=peer_SVL remote-address=10.10.255.4 remote-as=65531 address-families=l2vpn,vpnv4 instance=default update-source=loopback



/system identity
set name=R_LBN

/user
add name=staffeev password=strongpassword group=full
remove admin