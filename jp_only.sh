#!/bin/sh
cd `dirname $0`
IPTABLES=/sbin/iptables
wget -q -N http://nami.jp/ipv4bycc/cidr.txt.gz
gunzip -q -f -c cidr.txt.gz > cidr.txt
if [ -f cidr.txt ]; then
    $IPTABLES -F ACCEPT_FILTER
    sed -n 's/^JP\t//p' cidr.txt | while read address; do
        $IPTABLES -A ACCEPT_FILTER -s $address -j ACCEPT
    done
    $IPTABLES -A ACCEPT_FILTER -j DROP
fi
