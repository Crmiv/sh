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
clear

#enemy
plane_=('^o^' 'xox' 'qop' '-o-' 'uou' '#o#')
#        5     10    15    20    25     30
rock_=('^0^' 'x0x' 'q0p' '-0-' 'u0u' '#0#')
#        10    20    30   40    50     60
ship_="|__*__|"
#MAX_RIGHT=
MAXRIGHT=73
SHIP=30
bottom=30
cannoX=0
cannoY=0

declare -x scorekind=(5 10 15 20 25 30 10 20 30 40 50 60)
declare -x FIRE_RUN=0
declare -x SCORE=0
declare -x DELAY=1
declare -x EARTH="##########################################################################################################################"

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
	echo "|__*__|"
}

createearth()
{
	height=31
	tput cup 35 0
	#create earth
	
	for ((i=1; i<=3; i++))
	do
		echo $EARTH
	done
}

scoreadd()
{	
	getscore=${scorekind[$1]}
	SCORE=$[ $SCORE + $getscore ]
	tput cup 10 100
	echo $SCORE
}



fly()
{
	#donnot change FIRE_RUN
	X=$1
	Y=$2
	pgrep -F temp.tmp &> /dev/null
	if [ $? -eq 0 ];
	then
		return 0;
	fi

	(while :
		do
			if [ $Y -le 0 ];
			then
				break
			fi
			tput cup $Y $X; echo " "
			let Y--
			tput cup $Y $X; echo "o"
			sleep 0.1
		done
		)&
	echo $! > temp.tmp
}

#testfly()
#{

#}


createearth
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
				tput cup $bottom $[ $ship + 7 ] 
				echo " "
				tput cup $bottom $ship
				drawship
			else
				echo ""	
			fi
			scoreadd $DELAY
			;;

		d)
			if [ $SHIP -lt 60 ];
			then
				let ship++
				tput cup $bottom $[ $ship - 1 ]
				echo " " 
				tput cup $bottom $ship 
				drawship
			fi
			;;

		f)
			if [ $FIRE_RUN -eq 0 ];
			then
				
				#already fire,can not do again
				cannoX=$ship
				cannoY=$bottom
				#bomb fly
				tput cup $[ $bottom - 1 ] $[ $ship + 3 ]
				#new function bomb fly to sky
				fly $[ $ship + 3 ] $[ $bottom - 1 ]
			fi
			;;

		q)
			echo "GoodBye"
			clear
			tput cvvis
			stty echo
			trap exit ALRM
			sleep $DELAY
			exit 0
			;;
	esac
done
