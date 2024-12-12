#!/usr/bin/env bash

usage() {
	echo "Invalid args"
	echo -e "\nUsage:"
	echo -e "\t./dnd_character.sh modifier <number>"
	echo -e "\t./dnd_character.sh generate"

	exit 1
}

modifier() {
	constitution=$1
	remainder=$(( (constitution - 10) % 2 ))
	constitution_modifier=$(( (constitution - 10)  / 2 ))

	if [[ "${remainder}" -eq -1 ]]; then
		constitution_modifier=$(( constitution_modifier - 1 ))
	fi
}

generate() {
	abilities=(
		strength 
		dexterity 
		intelligence 
		wisdom 
		charisma 
		constitution
	)

	for abilitie in "${abilities[@]}"; do
		throws=$( for (( i = 0; i < 4; i ++ )); do echo $(( RANDOM % 6 + 1 )); done | sort )
		throws=$( echo "${throws}" | tr '\n' ' ' | cut -c2- )

		points=0
		for throw in $throws; do points=$(( points + throw )); done

		echo "${abilitie} ${points}"
	done

	modifier "${points}"
	hitpoints=$(( 10 + constitution_modifier ))
	
	echo "hitpoints ${hitpoints}"
}

main () {
	[[ "${#}" -lt 1 ]] && usage

	case $1 in
		modifier)
			[[ "${#}" -ne 2 ]] && usage

			modifier "${2}"
			echo "${constitution_modifier}"
		;;
		generate)
			generate
		;;
		*)
			usage
		;;
	esac
}

main "$@"

