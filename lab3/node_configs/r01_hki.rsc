/interface bridge
add name=loopback


/ip address
add address=10.0.35.3/24 interface=ether2
add address=10.0.13.3/24 interface=ether3
add address=10.0.34.3/24 interface=ether4
add address=3.3.3.3/32 interface=loopback


/routing ospf instance
set [find default=yes] router-id=3.3.3.3
/routing ospf network
add area=backbone network=10.0.13.0/24
add area=backbone network=10.0.34.0/24
add area=backbone network=10.0.35.0/24
add area=backbone network=3.3.3.3/32


/mpls ldp
set enabled=yes lsr-id=3.3.3.3 transport-address=3.3.3.3
/mpls ldp interface
add interface=ether2
add interface=ether3
add interface=ether4


/system identity
set name=R_HKI

/user
add name=staffeev password=strongpassword group=full
remove admin