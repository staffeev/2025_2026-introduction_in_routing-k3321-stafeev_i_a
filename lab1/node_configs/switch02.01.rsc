/interface bridge
add name=bridge1 vlan-filtering=yes

/interface bridge port
add bridge=bridge1 interface=ether2
add bridge=bridge1 interface=ether3 pvid=100

/interface vlan
add name=VLAN100 vlan-id=100 interface=bridge1

/ip address
add address=10.100.0.3/24 interface=VLAN100

/interface bridge vlan
add bridge=bridge1 vlan-ids=100 tagged=bridge1,ether2 untagged=ether3

/system identity
set name=SW02.01

/user
add name=staffeev password=strongpassword group=full
