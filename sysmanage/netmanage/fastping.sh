#!/bin/bash
function fastping()
{
for ip in 192.168.0.[1..255];
do
	(
		ping $ip -c 5 &> /dev/null;
		
		if [ $? -eq 0 ];
		then
			echo $ip is alive
		fi
	)&
done
wait
}


