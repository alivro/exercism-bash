#!/usr/bin/env bash

function blank() {
	[ -z "${1}" ] && blank_flag=true
}

function yell() {
	if [[ "${1}" =~ [A-Z] ]]; then
		if [[ "${1}" =~ [a-z] ]]; then
			yell_flag=false
		else
			yell_flag=true
		fi
	else
		yell_flag=false
	fi
}

function question() {
	[[ "${1}" =~ \?$ ]] && question_flag=true
}

main () {
	blank_flag=false
	yell_flag=false
	question_flag=false
	sentence=$(echo "${1}" | tr -d '[:space:]' )

	blank "${sentence}"
	yell "${sentence}"
	question "${sentence}"

	if [ "${yell_flag}" = true ]; then
		if [ "${question_flag}" = true ]; then
			echo "Calm down, I know what I'm doing!" && return 0 
		else
			echo "Whoa, chill out!" && return 0
		fi
	fi

	[ "${question_flag}" = true ] && echo "Sure." && return 0

	[ "${blank_flag}" = true ] && echo "Fine. Be that way!" && return 0
	
	echo "Whatever."
}

main "$@"

