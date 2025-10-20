/interface bridge
add name=loopback


/ip address
add address=10.0.46.4/24 interface=ether2
add address=10.0.24.4/24 interface=ether3
add address=10.0.34.4/24 interface=ether4
add address=4.4.4.4/32 interface=loopback

/routing ospf area
add name=area_us area-id=0.0.0.1
/routing ospf instance
set [find default=yes] router-id=4.4.4.4
/routing ospf network
add area=backbone network=10.0.24.0/24
add area=backbone network=10.0.34.0/24
add area=backbone network=4.4.4.4/32
add area=area_us network=10.0.46.0/24


/mpls ldp
set enabled=yes lsr-id=4.4.4.4 transport-address=4.4.4.4
/mpls ldp interface
add interface=ether2
add interface=ether3
add interface=ether4


/system identity
set name=R_LBN

/user
add name=staffeev password=strongpassword group=full
remove admin