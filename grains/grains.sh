#!/usr/bin/env bash

function total() {
	base=2
	exponent=$((63+1))
	result=$(bc <<< "($base^$exponent)-1")
	
	echo "${result}"
}

main () {
	[ "${#*}" -lt 1  ] && echo "Error: invalid input" && exit 1
	[ "${1}" = "total" ] && total && exit 0
	[ "${1}" -lt 1  ] || [ "${1}" -gt 64  ] && echo "Error: invalid input" && exit 1

	base=2
	exponent=$(($1-1))
	result=$(bc <<< "$base^$exponent")

	echo "${result}"
}

main "$@"

