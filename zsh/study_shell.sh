#!/bin/bash

cont=0
for var in $(cat /home/zetdg/yoda_psql.dat);
do
	cont=$((cont+1))
	echo $cont
	eval "var$cont=$var";
done

database='a'

if [ -z $database ]; then
	echo "is empty"
fi


