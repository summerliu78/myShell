#!/bin/sh

hosts=`cat $1`;
SOURCE=$2;
DEST=$3; 

for i in ${hosts}; do
	echo ${i};
	scp  -r ${SOURCE} ${i}:${DEST};
done

