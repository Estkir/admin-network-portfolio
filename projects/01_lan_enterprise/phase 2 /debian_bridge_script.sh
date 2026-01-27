#!/bin/bash
ip link del br0 2>/dev/null
ip link add br0 type bridge vlan_filtering 1
ip link set br0 up

ip link set ens3 master br0
ip link set ens4 master br0
ip link set ens5 master br0
ip link set ens6 master br0
ip link set ens7 master br0

ip link set ens3 up
ip link set ens4 up
ip link set ens5 up
ip link set ens6 up
ip link set ens7 up

bridge vlan add dev ens3 vid 10
bridge vlan add dev ens3 vid 20

bridge vlan add dev ens4 vid 10 pvid untagged
bridge vlan add dev ens5 vid 10 pvid untagged
bridge vlan add dev ens6 vid 20 pvid untagged
bridge vlan add dev ens7 vid 20 pvid untagged
