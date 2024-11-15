#!/usr/bin/env bash

acronym=""

set -f

string=${1//'-'/' '}
string=${string//'_'/' '}
string=${string//'*'/' '}

for word in ${string}
do
	acronym="${acronym}${word:0:1}"
done
	
echo "${acronym}" | tr 'a-z' 'A-Z'
