/interface bridge
add name=bridge1 vlan-filtering=yes

/interface bridge port
add bridge=bridge1 interface=ether2
add bridge=bridge1 interface=ether3 pvid=200

/interface vlan
add name=VLAN200 vlan-id=200 interface=bridge1

/ip address
add address=10.200.0.3/24 interface=VLAN200

/interface bridge vlan
add bridge=bridge1 vlan-ids=200 tagged=bridge1,ether2 untagged=ether3

/system identity
set name=SW02.02

/user
add name=staffeev password=strongpassword group=full
