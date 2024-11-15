#!/usr/bin/env bash

function pangram() {
	for letter in {a..z}; do
		[[ ! "${1}" =~ ${letter} ]] && echo false && exit 0
	done

	echo true
}

main () {
	[ "${#}" -lt 1 ] && exit 1
	
	pangram "${*,,}"
}

main "$@"

