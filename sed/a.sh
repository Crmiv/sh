#!/bin/bash
echo hello world | sed s/hello/Hello/
#-n regex expression only affect the first line
sed -n 's/^/<text>/;s/$/<\/text>/p;q' text

#you can use a sed file
#like that
#a.sed
#

#!/usr/bin/sed

s/^/<h1>/
s/$/</h1>/
q

#use sed -f a.sed text

# sed -E extended-regex-expression
# -C count number
grep -E '\<(THE|the|The)\>' text
sed '1 i\some ' text2 
grep -Ec "(Some|SOME|some)" filename

#exchange pattern
# digit as text replace flag
# g : all example ,all the string
# p : like print 
# w file : write in the file
#
sed 's/pattern/replacement/flag'
sed -n 's/pattern/replacement/p' | ...

#if replacement or pattern  exist this '/' character
#use ! like
sed 's!/bin/bash!/usr/bin/bash!' filename

#line flag
#sed '2s.....'
#sed '2,$s.....'
#...

#file pattern parser
sed '/xxx/s/aaa/ccc/' filename

sed '2{
s/...../
s/...../
}' filename

#delete line use digit before 'd'

sed '3d' filename
# delete data from ...->...1
# match some times
# BE CAREFUL!
#

sed '/.../,/...1/d' filename

#can use echo |
sed '[address]command\
	new line'

#exp
#group name ,multi-language
#(?<name>...) 
#(?P<name>...) python
#(?P=name...) python

sed '3c\
	newline ' filename
sed '/pattern/c\
	newline ' filename

#dont use it
#possible happen strange thing
sed '/pattern/1,4c\
	newline ' filename

#character change command
sed 'y/123/456/' filename

#sed print-command
#p -- text-line
#= -- line-number
#l -- list

#### file operation
sed '1,2w somefile' textfile
#from textfile get text-stream written in somefile

##pipe command to sh
find /home/xxx -type d -print | sed 's;/xx;/yy/' | sed 's/^/mkdir /' | sh -x 
