#!/usr/bin/env bash

# Usage:
#   secret_handshake.sh <number>

ACTIONS=(
	"wink"
	"double blink"
	"close your eyes"
	"jump"
)

function reverse_actions {
	tmp=()
	
	for (( i = ${#handshake[@]}-1; i >= 0; i-- )); do
	    tmp+=("${handshake[i]}")
	done
	
	handshake=("${tmp[@]}")
}

function print_actions {
	for (( i = 0; i < ${#handshake[@]}-1; i++ )); do
		echo -n "${handshake[i]},"
	done

	echo -en "${handshake[i]}\n"
}

main () {
	[[ "${#}" -ne 1 ]] && exit 1

	# Decimal to binary
	binary=$(echo "obase=2; ${1}" | bc)
	binary_rev=$(printf "%05d" "${binary}" | rev)
	handshake=()

	# Actions
	for (( i = 0; i < 4; i++ )); do
		[[ "${binary_rev:i:1}" -eq 1 ]] && handshake+=("${ACTIONS[i]}")
	done

	# Reverse actions
	[[ "${binary_rev:4:1}" -eq 1 ]] && reverse_actions

	# Print actions
	print_actions
}

main "$@"

