#!/bin/bash
URL=''
HOST=''
USER=''

#-f before run it ,enter background
#-N do no command
ssh -fL 8000:$URL:80 $USER@$HOST -N

#IMPORTANT
ssh -R 8000:localhost:80 user@REMOTE_MACHINE

