#!/bin/bash
a=()
a[0]=1
a[1]=2

test_()
{
	echo ${1[0]} 
}

test_ $a
