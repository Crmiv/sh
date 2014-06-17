#!/bin/bash

IFACE=wlp3s0
IP_ADDR=192.168.1.10
SUBNET_MASK=255.255.255.0
GW=192.168.1.1
#if use physical cheat, cancel '#'
#HW_ADDR=''

ESSID="home"
WAP_KEY=''
#scan your surrounding,and use command 'iwlist scan'
FREQ=''

if [[ -n $WAP_KEY ]];
then
	KEY_PART="key $WAP_KEY"
fi

#test root
if [ $UID -ne 0 ];
then
	echo "Use root run it"
	exit 1;
fi

#shutdown your interface
/sbin/ifconfig $IFACE down

#edit HW_ADDR in temp, and /sbin/reboot it revert
if [[ -n $HW_ADDR ]];
then
	/sbin/ifconfig $IFACE hw ether $HW_ADDR
fi

/sbin/iwconfig $IFACE essid $ESSID $KEY_PART freq $FREQ
/sbin/ifconfig $IFACE $IP_ADDR netmask $SUBNET_MASK
route add default gw $GW $IFACE

print "Successful"

