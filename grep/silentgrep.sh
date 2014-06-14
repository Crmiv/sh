#!/bin/bash

if [ $# -ne 2 ];then
	echo "Usage $0 matchtext filename"
	exit 1
fi

match_text=$1
filename=$2
grep -q "$match_text" $filename

if [ $? -eq 0 ]; then
	echo "text exist in the file"
else
	echo "text doesnt exist in the file"
fi

