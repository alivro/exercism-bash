#!/usr/bin/env bash

main () {
  # your main function code here
  if [ $# -eq 1 ]
  then
	echo "Hello, $1"
  else
	echo "Usage: error_handling.sh <person>"
	exit 1
  fi
}

# call main with all of the positional arguments
main "$@"
