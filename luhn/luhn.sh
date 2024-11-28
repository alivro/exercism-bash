#!/usr/bin/env bash

function luhn_algorithm () {
	number=$1
	length=${#number}
	sum=0
	even=1

	for(( i=$((length-1)); i>=0; i-- )); do
		digit=${number:i:1}

		if [[ $((even%2)) == 0 ]]; then
			digit=$((digit*2))

			if [[ "${digit}" -gt 9 ]]; then
				digit=$((digit-9))
			fi
		fi

		sum=$((sum+digit))
		even=$((even+1))
	done

	[[ $((sum%10)) == 0 ]] && echo "true" && exit 0

	echo "false" && exit 0
}

main () {
	number=${*}
	number=${number// /}

	[[ "${#number}" -le 1 ]] && echo "false" && exit 0
	
	[[ "${number}" =~ ^[0-9]+$ ]] && luhn_algorithm "${number}"

	echo false && exit 0
}

main "$@"

