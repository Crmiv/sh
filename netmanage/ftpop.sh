#!/bin/bash

HOST='218.244.136.182'
USER='root'
PASSWORD=$1
ftp -i -n $HOST <<EOF
user ${USER} ${PASSWORD}
binary
cd $2
put $3
get $4
quit
EOF
