#!/usr/bin/env bash

main () {
	word=${*^^}
	length=${#word}
	points=0

	[ "${length}" -eq 0 ] && echo "0" && exit 0

	for (( i=0; i<length; i++ )); do
		letter=${word:i:1}

		[[ "${letter}" =~ ^(A|E|I|O|U|L|N|R|S|T)$ ]] &&
			points=$((points+1)) && continue

		[[ "${letter}" =~ ^(D|G)$ ]] &&
			points=$((points+2)) && continue

		[[ "${letter}" =~ ^(B|C|M|P)$ ]] &&
			points=$((points+3)) && continue

		[[ "${letter}" =~ ^(F|H|V|W|Y)$ ]] &&
			points=$((points+4)) && continue

		[[ "${letter}" =~ ^(K)$ ]] &&
			points=$((points+5)) && continue

		[[ "${letter}" =~ ^(J|X)$ ]] &&
			points=$((points+8)) && continue

		[[ "${letter}" =~ ^(Q|Z)$ ]] &&
			points=$((points+10))
	done

	echo "${points}"
}

main "$@"

