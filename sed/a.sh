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

# -C count number
grep -E '\<(THE|the|The)\>' text
sed '1 i\some ' text2 


