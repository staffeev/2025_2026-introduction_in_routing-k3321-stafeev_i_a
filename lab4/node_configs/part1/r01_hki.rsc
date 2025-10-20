/interface bridge
add name=loopback


/ip address
add address=10.0.12.2/24 interface=ether2
add address=10.0.23.2/24 interface=ether3
add address=10.0.25.2/24 interface=ether4
add address=2.2.2.2/32 interface=loopback


/routing ospf instance
set [find default=yes] router-id=2.2.2.2
/routing ospf network
add area=backbone network=10.0.12.0/24
add area=backbone network=10.0.23.0/24
add area=backbone network=10.0.25.0/24
add area=backbone network=2.2.2.2/32


/routing bgp instance
set default as=65000 router-id=2.2.2.2 cluster-id=10.10.10.10
/routing bgp network
add network=2.2.2.2/32
/routing bgp peer
add name=peer_SPB remote-address=1.1.1.1 remote-as=65000 instance=default update-source=loopback
add name=peer_LBN remote-address=3.3.3.3 remote-as=65000 instance=default update-source=loopback route-reflect=yes
add name=peer_LND remote-address=5.5.5.5 remote-as=65000 instance=default update-source=loopback route-reflect=yes


/system identity
set name=R_HKI

/user
add name=staffeev password=strongpassword group=full
remove admin