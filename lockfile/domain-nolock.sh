#!/bin/bash
KEYFILE=/tmp/domains.txt
MYDOMAIN=$1
LOCK=/tmp/lock.myapp
mydom=/tmp/${MYDOMAIN}.$$

function cleanup
{
	release_lock
	exit 0
}

#catch signal call cleanup
trap 1 2 3 6 cleanup

function release_lock
{
	MYPID=$1
	sed -i "/^${MYPID}$/d" $LOCK
}

function get_lock
{
	#can define by your need
	DELAY=2
	GOT_LOCK=0
	MYPID=$1
	while [ "$GOT_LOCK" -ne "1" ]
	do
		PID=
		while [ -s "$LOCK" ]
		do
			PID=`cat $LOCK 2>/dev/null`
			name=`ps -o comm= -p "$PID" 2>/dev/null`
			if [ -z "$name" ]; then
				echo "$PID claimed this lock,but is not running"
				release_lock $PID
			
			else
				echo "$name has already taken the lock:"
				ps -fp $PID | sed -e 1d
				date
				echo 
				sleep $DELAY
				let DELAY="$DELAY + 1"
			fi
		done
		echo $MYPID >> $LOCK
		grep -vw $MYPID $LOCK > /dev/null 2>1&
			if [ "$?" -eq "0"];then
				echo "Another has taken the lock"
				ps -fp `grep -vw -e $MYPID -e "$PID" $LOCK`
				sed -i "/^${MYPID}$/d" $LOCK
				sleep $((RANDOM % 5))
			else
				GOT_LOCK=1
				echo $MYPID > $LOCK

			fi
	done
}
get_lock $$

##
##
##
##


