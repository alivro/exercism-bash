#!/usr/bin/env bash

function calculate_armstrong_number() {
	pow=${#1}
	armstrong_number=0

	for (( i=0; i<${#1}; i++ ))
	do
		digit=${1:i:1}
		pow_number=$((digit**pow))
		armstrong_number=$((armstrong_number+pow_number))
	done
}

main () {
	calculate_armstrong_number "${1}"

	if [ "${armstrong_number}" -ne "${1}" ]
	then
		echo "false"
	else
		echo "true"
	fi
}

main "$@"
