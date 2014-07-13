#!/bin/bash
netstat -tnp
netstat -tnp | grep -E \
	"[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" -o | tr -d '' | sort | uniq 
