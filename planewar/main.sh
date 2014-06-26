#!/bin/bash

stty -echo

#make cursor disappear
tput civis
#and make appear , use `tput cvvis`
clear

#instruction
cat - << EOF
		
		SPACE

	LEFT:	a
	RIGHT:	d
	FIRE:	f

	QUIT:	q
				press any key to start

EOF


#START
read -s -n 1

#enemy
plane_=('^o^' 'xox' 'qop' '-o-' 'uou' '#o#')
rock_=('^0^' 'x0x' 'q0p' '-0-' 'u0u' '#0#')
ship_="|__*__|"
#MAX_RIGHT=
MAXRIGHT=73
SHIP=30
bottom=30
cannoX=0
cannoY=0
fire_run=0

randtype()
{
	if [[ $1 == "plane" ]];
	then
		enemy=$[ $RANDOM % 12]
		position=$[ $RANDOM % 68 ]
		# 0-67 width
		return num="$enemy $position"
	fi
}

drawship()
{
	echo "aaa"
}

fly()
{
(	fire_run=0
	X=$1
	Y=$2
	while :
	do
		if [ $Y -le 0 ];
		then
			break
		fi
		tput cup $Y $X; echo " "
		let Y--
		tput cup $Y $X; echo "Z"
		sleep 0.2
	done
	)&
}

#testfly()
#{

#}


#main
while :
do
	read -s -n 1 key
	case "$key" in
		a)
			#go to left
			if [ $SHIP -gt 3 ] && [ $ship -gt 1 ];
			then
				let ship--
				#call drawback
				tput cup $bottom $[ $ship + 3 ] 
				echo " "
				tput cup $bottom $ship
				drawship
			else
				echo ""	
			fi
			
			;;
		d)
			if [ $SHIP -lt 70 ];
			then
				let ship++
				tput cup $bottom $[ $ship - 1 ]
				echo " " 
				tput cup $bottom $ship 
				drawship
			fi
			;;
		f)
			if [ $fire_run -eq 0 ];
			then
				
				#already fire,can not do again
				fire_run=1

				cannoX=$ship
				cannoY=$bottom
				#bomb fly
				tput cup $[ $bottom - 1 ] $[ $ship + 1 ]
				#new function bomb fly to sky
				echo "Z"
				fly $[ $ship + 1 ] $[ $bottom - 1 ]
			fi
			;;
		q)
			echo "GoodBye"
			tput cvvis
			stty echo
			trap exit ALRM
			sleep $DELAY
			exit 0
			;;
	esac
done
