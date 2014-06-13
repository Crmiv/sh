#!/bin/bash
sed 's/pattern/replace_string/' file
cat file | sed 's/pattern/replacement/'

#replace all
sed 's/pattern/replacement/g' file

#当定界符出现在其中需要用\进行转义

#移除空白行
sed '/^$/d' file
#
