#!/usr/bin/env bash

main () {
	if [[ "${#}" -eq 1 && "${1}" =~ ^[0-9]+$ ]]; then
		num=$1
		
		[[ $(( num % 4 )) -eq 0 && $(( num % 100 )) -ne 0 ]] && echo "true" && exit 0
		[[ $(( num % 400 )) -eq 0 ]] && echo "true" && exit 0

		echo "false"
		exit 0
	else
		echo "Usage: leap.sh <year>"
		exit 1
	fi
}

main "$@"

