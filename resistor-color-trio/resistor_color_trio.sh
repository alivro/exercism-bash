#!/usr/bin/env bash

# Usage:
#   ./resistor_color_trio.sh <color_1> <color_2> <color_3>

declare -A BAND_COLORS=(
	[black]=0 
	[brown]=1 
	[red]=2 
	[orange]=3 
	[yellow]=4 
	[green]=5 
	[blue]=6 
	[violet]=7 
	[grey]=8 
	[white]=9
)

usage () {
	echo "Invalid number of arguments"
	echo -e "\nUsage:"
	echo -e "\t./resistor_color_trio.sh <color_1> <color_2> <color_3>"
	exit 1
}

fail () {
	echo "Invalid color: ${1}"
	exit 1
}

calculate_colors () {
	bands=("${1}" "${2}")
    total=0

	for (( i = 0; i < 2; i ++ )); do
		# Get band color
		band=${bands[1-$i]}

		# Get the band value
		value=${BAND_COLORS[$band]}

		# Invalid band color
		[[ -z "$value" ]] && fail "${band}"

		(( total += (value * 10 ** i) ))
	done
}

calculate_zeros () {
	band=$1

	# Get the band value
	value=${BAND_COLORS[$band]}
	
	# Invalid band color
	[[ -z "$value" ]] && fail "${band}"

	total=$(( total * (10 ** value) ))
}

prefix () {
	giga=$(( 10 ** 9 ))
	mega=$(( 10 ** 6 ))
	kilo=$(( 10 ** 3 ))
	prefix=""

	if [[ "${total}" -ge $(( 2 * giga )) ]]; then
		total=$( bc <<< "${total} / ${giga}" )
		prefix="giga"
	elif [[ "${total}" -ge $(( 2 * mega )) ]]; then
		total=$( bc <<< "${total} / ${mega}" )
		prefix="mega"
	elif [[ "${total}" -ge $(( 2 * kilo )) ]]; then
		total=$( bc <<< "${total} / ${kilo}" )
		prefix="kilo"
	fi
}

main () {
	[[ "${#@}" -lt 3 ]] && usage

	calculate_colors "${1}" "${2}"
	calculate_zeros "${3}"
	prefix

	echo "${total} ${prefix}ohms"
}

main "${@}"

