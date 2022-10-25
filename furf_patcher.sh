#!/bin/bash

while getopts "" o; do
	case $o in
		*) packdir=$o ;;
	esac
done

main(){
# create temp directory assuming it does not exist
if ! ls temp > /dev/null; then
  echo "temp does not exist, creating"
  mkdir temp
else
  echo "temp already exists, exiting"
  exit
fi

unzip "$packdir" -d temp/pack
}

main
