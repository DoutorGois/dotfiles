#!/bin/bash

if [ "$#" -lt 4 ]; then
    echo "You didn't inform IP"
    RIP="177.20.140.1"
else
    RIP=$4
fi

if [ "$#" -lt 3 ]; then
    RUSER="zetdg"
else
    RUSER=$3
fi

if [ "$#" -lt 2 ]; then
    LPORT="8888"
else
    LPORT=$2
fi

if [ "$#" -lt 1 ]; then
    RPORT="8443"
else
    RPORT=$1
fi

echo $#
echo $RUSER
echo $RIP
echo $LPORT
echo $RPORT

echo ssh -L $LPORT:$RIP:$RPORT $RUSER@$RIP

google-chrome "http://localhost:8888" &
ssh -L $LPORT:$RIP:$RPORT $RUSER@$RIP
