#!/bin/bash

i=0

for n in `ls -d */`
do
	n=${n:0:${#n}-1}
	while read -r linea
	do
		contatoreRighe=0
		if [ $contatoreRighe -eq 0 ]
		then
			contatoreRighe=1
			if [ $i -eq 1 ]
			then
				echo "${linea};filiale" > merged.csv
			fi
		else
			echo "$linea;$n"  >> merged.csv 
		fi
	done < $n/export.csv
	i=$((i+1))
done