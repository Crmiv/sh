#!/bin/bash
sed 's/pattern/replace_string/' file
cat file | sed 's/pattern/replacement/'

#replace all
sed 's/pattern/replacement/g' file

#当定界符出现在其中需要用\进行转义

#移除空白行
sed '/^$/d' file

#replace 三位数
sed -i 's/\b[0-9]\{3\}\b/NUMBER/g' filename

#cite the former that match 
echo this is an example | sed 's/\w\+/[&]/g'

#back reference
echo seven EIGHT | sed 's/\([a-z]\+\) \([a-z]\+\)/\2 \1/'

