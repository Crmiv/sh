#!/bin/bash
#egrep , extend from grep use regex expression
#count matched-item
echo -e "1 2 3\nword\4 5 6" | egrep -o "[0-9]" | wc -l

#calculate offset
echo "gnu is not unix" | grep -b -o "not"

#Important and efficient
grep "text" . -R -n

#ignore case sensitive
grep -i "" filename

grep "main()" . -r --include *.{c.cpp}
grep "main()" . -r --exclude Makefile*

