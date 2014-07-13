#!/bin/bash

declare -A version
declare -A number

exportHtm=output.html
#>output.html

function rpmnames
{
	for rpm in `cat $* | sort -u`
	do
		echo ${rpm%-*-*}
	done 
}

function readrpms 
{
	for node in $*
	do
		while read rpm
		do
			rpmname=${rpm%-*-*}
			rpmnameversion=${rpm%-*}
			rpmversion=${rpmnameversion##*-}
			rpmrelease=${rpm##*-}
			idx=${node}_${rpmname}
			#-z test if null
			if [ -z "" ]; then
				
			else
			
			fi
		done
	done
}|
