#!/usr/bin/env bash

#
# Usage:
#   resistor_color_duo.sh <color_1> <color_2>
#

BAND_COLORS=("black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white")

main () {
	[[ "${#@}" -eq  0 ]] && exit 1

	pow=0
	total=0

	for (( i = 2; i > 0; i-- )); do
		band=${!i}

		for (( j = 0; j < ${#BAND_COLORS[@]}; j++ )); do
			if [[ "${band}" == "${BAND_COLORS[j]}" ]]; then
				value=$(( j * 10 ** pow ))
				total=$(( total + value ))
				pow=$(( pow +1 ))

				break;
			fi
		done

		[[ "${j}" -eq ${#BAND_COLORS[@]} ]] && echo "invalid color" && exit 1
	done

	echo $total
}

main "$@"

