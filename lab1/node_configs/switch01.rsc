/interface bridge
add name=bridge1 vlan-filtering=yes

/interface bridge port
add bridge=bridge1 interface=ether2
add bridge=bridge1 interface=ether3
add bridge=bridge1 interface=ether4

/interface vlan
add name=VLAN100 vlan-id=100 interface=bridge1
add name=VLAN200 vlan-id=200 interface=bridge1

/ip address
add address=10.100.0.2/24 interface=VLAN100
add address=10.200.0.2/24 interface=VLAN200

/interface bridge vlan
add bridge=bridge1 vlan-ids=100 tagged=bridge1,ether2,ether3,ether4
add bridge=bridge1 vlan-ids=200 tagged=bridge1,ether2,ether3,ether4

/system identity
set name=SW01

/user
add name=staffeev password=strongpassword group=full
