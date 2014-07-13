#!/bin/bash
if [ "$1" == "-a" ];then
	autostart=yes
	#service name
	serv=$2
else
	autostart=no
	serv=$1
fi
# determine distribution
if [ -f /etc/SuSE-brand ] || [-f /etc/SuSE-release ];then
	distro=suse
fi

init_dir=/etc/init.d
rc_dir=/etc
chkconfig --add $serv
if [ $autostart == yes ]; then
	chkconfig $service on
fi



