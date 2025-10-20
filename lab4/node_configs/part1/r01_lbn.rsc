/interface bridge
add name=loopback


/ip address
add address=10.0.34.3/24 interface=ether2
add address=10.0.23.3/24 interface=ether3
add address=10.0.35.3/24 interface=ether4
add address=3.3.3.3/32 interface=loopback


/routing ospf instance
set [find default=yes] router-id=3.3.3.3
/routing ospf network
add area=backbone network=10.0.23.0/24
add area=backbone network=10.0.34.0/24
add area=backbone network=10.0.35.0/24
add area=backbone network=3.3.3.3/32


/routing bgp instance
set default as=65000 router-id=3.3.3.3
/routing bgp network
add network=3.3.3.3/32
/routing bgp peer
add name=peer_HKI remote-address=2.2.2.2 remote-as=65000 instance=default update-source=loopback route-reflect=yes
add name=peer_LND remote-address=5.5.5.5 remote-as=65000 instance=default update-source=loopback route-reflect=yes
add name=peer_SVL remote-address=4.4.4.4 remote-as=65000 instance=default update-source=loopback



/system identity
set name=R_LBN

/user
add name=staffeev password=strongpassword group=full
remove admin