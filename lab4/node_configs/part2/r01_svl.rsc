/interface bridge
add name=loopback

/ip address
add address=10.0.12.2/24 interface=ether2
add address=10.0.24.2/24 interface=ether3
add address=2.2.2.2/32 interface=loopback


/routing ospf instance
set [find default=yes] router-id=2.2.2.2
/routing ospf network
add area=backbone network=10.0.12.0/24
add area=backbone network=10.0.24.0/24
add area=backbone network=2.2.2.2/32


/mpls ldp
set enabled=yes lsr-id=2.2.2.2 transport-address=2.2.2.2
/mpls ldp interface
add interface=ether2
add interface=ether3


/system identity
set name=R_MSK

/user
add name=staffeev password=strongpassword group=full
remove admin