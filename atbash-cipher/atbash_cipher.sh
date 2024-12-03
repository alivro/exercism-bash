#!/usr/bin/env bash

function encode() {
	sentence=$*
	sentence=$(echo "${sentence}" | tr '[:upper:]' '[:lower:]' | tr -d ',. ')
	cipherText=$(echo -n "${sentence}" | tr "$PLAIN" "$CIPHER" | fold -w 5 | tr '\n' ' ')

	echo "$cipherText"
}

function decode() {
	sentence=$*
	sentence=$(echo "${sentence}" | tr '[:upper:]' '[:lower:]' | tr -d ' ')
	plainText=$(echo "${sentence}" | tr "$CIPHER" "$PLAIN")

	echo "${plainText}"
}

main () {
	PLAIN=$(echo {a..z} | tr -d ' ')
	CIPHER=$(echo {z..a} | tr -d ' ')

	[[ "${#}" -eq 0 ]] && exit 0

	case $1 in
		encode)
			encode "${*:2}"
		;;
		decode)
			decode "${*:2}"
		;;
	esac
}

main "$@"

