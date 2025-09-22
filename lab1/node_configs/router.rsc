/interface vlan
add name=VLAN100 vlan-id=100 interface=ether2
add name=VLAN200 vlan-id=200 interface=ether2

/ip address
add address=10.100.0.1/24 interface=VLAN100
add address=10.200.0.1/24 interface=VLAN200

/ip pool
add name=dhcp_vlan100_pool ranges=10.100.0.100-10.100.0.254
add name=dhcp_vlan200_pool ranges=10.200.0.100-10.200.0.254

/ip dhcp-server network
add address=10.100.0.0/24 gateway=10.100.0.1
add address=10.200.0.0/24 gateway=10.200.0.1

/ip dhcp-server
add address-pool=dhcp_vlan100_pool disabled=no interface=VLAN100 name=dhcp_vlan100
add address-pool=dhcp_vlan200_pool disabled=no interface=VLAN200 name=dhcp_vlan200

/system identity
set name=R01

/user
add name=staffeev password=strongpassword group=full

