#!/usr/bin/env bash

# Usage:
#   ./proverb.sh [string_1] [string_2]...

main () {
	[[ "${#}" -eq 0 ]] && echo "" && exit

	words=("$@")
	len=${#words[@]}

	for (( i = 1; i < len; i ++ )); do
		echo "For want of a ${words[$i-1]} the ${words[$i]} was lost."
	done

	echo "And all for the want of a ${words[0]}."
}

main "$@"

