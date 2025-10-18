/interface bridge
add name=loopback


/ip address
add address=10.0.35.3/24 interface=ether2
add address=10.0.13.3/24 interface=ether3
add address=10.0.34.3/24 interface=ether4
add address=3.3.3.3/24 interface=loopback


/routing ospf instance
set [find default=yes] router-id=3.3.3.3
/routing ospf network
add area=backbone network=10.0.13.0/24
add area=backbone network=10.0.34.0/24
add area=backbone network=10.0.35.0/24

/system identity
set name=R_HKI

/user
add name=staffeev password=strongpassword group=full
remove admin