#!/usr/bin/env bash

main () {
	if [ $# -ne 2 ]
	then
		echo "Usage: hamming.sh <string1> <string2>"
		exit 1;
	fi

	strand_a=$1
	strand_b=$2

	if [ "${#strand_a}" -ne "${#strand_b}" ]
	then
		echo "strands must be of equal length"
		exit 1
	fi

	count=0

	for (( i=0; i<"${#strand_a}"; i++ ))
	do
		if [ "${strand_a:i:1}" != "${strand_b:i:1}" ]
		then
			count=$((count+1))
		fi
	done

	echo $count
}

main "$@"

