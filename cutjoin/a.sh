#!/bin/bash

cut -f 1 filename
cut -f 1,3 filename
cut -f 1,3 --complement filename

#指定字符的定界符
cut -f 1,3 -d";" filename


######### from shell o'reilly
#-d : 以:作为定界符
cut -d : -f 1,5


