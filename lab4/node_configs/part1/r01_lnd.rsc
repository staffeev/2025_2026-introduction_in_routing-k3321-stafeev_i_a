/interface bridge
add name=loopback


/ip address
add address=10.0.56.5/24 interface=ether2
add address=10.0.25.5/24 interface=ether3
add address=10.0.35.5/24 interface=ether3
add address=5.5.5.5/32 interface=loopback


/routing ospf instance
set [find default=yes] router-id=5.5.5.5
/routing ospf network
add area=backbone network=10.0.25.0/24
add area=backbone network=10.0.35.0/24
add area=backbone network=10.0.56.0/24
add area=backbone network=5.5.5.5/32


/routing bgp instance
set default as=65000 router-id=5.5.5.5
/routing bgp network
add network=5.5.5.5/32
/routing bgp peer
add name=peer_NY remote-address=6.6.6.6 remote-as=65000 instance=default update-source=loopback
add name=peer_HKI remote-address=2.2.2.2 remote-as=65000 instance=default update-source=loopback route-reflect=yes
add name=peer_LBN remote-address=3.3.3.3 remote-as=65000 instance=default update-source=loopback route-reflect=yes


/system identity
set name=R_LND

/user
add name=staffeev password=strongpassword group=full
remove admin