#!/usr/bin/env bash

function usage() {
	echo "Invalid args"
	echo -e "\nUsage: ./darts.sh <number_1> <number_2>"
}

main () {
	[[ "${#}" -ne 2 ]] && usage  && exit 1
	
	[[ "${1}" =~ [a-zA-Z] ]] || [[ "${2}" =~ [a-zA-Z] ]] \
		&& usage && exit 1

	distance=$(bc <<< "scale=2; sqrt(($1*$1)+($2*$2))")

	if [[ $(echo "${distance} > 10" | bc) -ne 0 ]]; then
		echo "0"
	elif [[ $(echo "${distance} > 5" | bc) -ne 0 ]]; then
		echo "1"
	elif [[ $(echo "${distance} > 1" | bc) -ne 0 ]]; then
		echo "5"
	else
		echo "10"
	fi
}

main "$@"

