#!/bin/bash

main(){
# create temp directory assuming it does not exist
if ! ls temp > /dev/null; then
  echo "temp does not exist, creating"
  mkdir temp
else
  echo "temp already exists, exiting"
  exit
fi
}

main
