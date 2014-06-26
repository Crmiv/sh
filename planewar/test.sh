#!/bin/bash
declare -x scorekind
scorekind[0]=1
scorekind[1]=3
scoreadd()
{	
	getscore=${scorekind[$1]}
	echo $getscore
}
tput cup 0 0
echo "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa \
	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"	

