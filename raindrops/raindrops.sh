#!/usr/bin/env bash

main () {
	flag=true

	if [ $(($1%3)) -eq 0 ]
	then
		echo -n "Pling"
		flag=false
	fi

	if [ $(($1%5)) -eq 0 ]
	then
		echo -n "Plang"
		flag=false
	fi

	if [ $(($1%7)) -eq 0 ]
	then
		echo -n "Plong"
		flag=false
	fi

	if [ "$flag" == true ]
	then
		echo "$1"
	fi
}

main "$@"
