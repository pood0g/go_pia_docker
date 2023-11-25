#!/bin/bash

# Force traffic with source port 9091 to use the docker interface rather than the pia interface

default_gw=$(ip r | grep "default via" | awk '{printf "dev %s via %s",$5,$3}')

if [ $1 = "up" ]
    then
        iptables -t mangle -I OUTPUT -p tcp --sport 9091 -j MARK --set-mark 9091
        ip route add table 9091 default $default_gw
        ip rule add priority 1000 fwmark 9091 table 9091
elif [ $1 = "down" ]
    then
        iptables -t mangle -D OUTPUT -p tcp --sport 9091 -j MARK --set-mark 9091
        ip route del table 9091 default $default_gw
        ip rule del priority 1000 fwmark 9091 table 9091
fi 

