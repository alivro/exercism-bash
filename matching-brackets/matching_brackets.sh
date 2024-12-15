#!/usr/bin/env bash

# Usage:
#   ./matching_brackets.sh "<string>"

mismatched() {
	echo "false"
	exit
}

main () {
	sentence="${*}"
	stack=()
	count=-1

	for (( i = 0; i < ${#sentence}; i ++)); do
		char=${sentence:i:1}

		if [[ "${char}" =~ [\[\{\(] ]]; then
			(( count++ ))
			stack[count]=${char}
		elif [[ "${char}" =~ [\]\}\)] ]]; then
			# If there is no element in the stack
			[[ "${count}" -eq -1 ]] && mismatched

			# Last element in the stack
			pop=${stack[$count]}

			# If match "[]" or "{}" or "()"
			if [[ "${pop}${char}" =~ ^(\[\]|\{\}|\(\))$ ]]; then
				(( count-- ))
				continue
			fi

			mismatched
		fi
	done

	[[ "${count}" -ne -1 ]] && mismatched

	echo "true" && exit
}

main "$@"

