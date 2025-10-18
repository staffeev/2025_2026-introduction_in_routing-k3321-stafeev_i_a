/interface bridge
add name=loopback


/ip address
add address=10.0.35.5/24 interface=ether2
add address=10.0.56.5/24 interface=ether3
add address=5.5.5.5/24 interface=loopback


/routing ospf area
add name=area_us area-id=0.0.0.1
/routing ospf instance
set [find default=yes] router-id=5.5.5.5
/routing ospf network
add area=backbone network=10.0.35.0/24
add area=area_us network=10.0.56.0/24


/system identity
set name=R_LND

/user
add name=staffeev password=strongpassword group=full
remove admin