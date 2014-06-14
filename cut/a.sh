#!/bin/bash

cut -f1 filename
cut -f1,3 filename
cut -f1,3 --complement filename

#指定字符的定界符
cut -f1,3 -d";" filename

