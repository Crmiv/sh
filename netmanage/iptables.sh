#!/bin/bash
IP=''
if [ $UID -ne 0 ];
then
	echo "please use root"
	exit 1;
fi

#drop flow from localhost to remote-host
iptables -A OUTPUT -d $IP -j DROP
#drop flow from one port.21 port belongs to ftp-proto
iptables -A OUTPUT -p tcp -dport 21 -j DROP
#initial iptables-parameters
iptables --flush


