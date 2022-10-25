#!/bin/bash

while getopts "Dh" o; do
	case $o in
	  D) no_delete_temp=true ;;
	  h) show_help=true ;;
		*) ;;
	esac
done

patch(){
  #this function serves as the configuration for this script, simply put a hashtag before any changes you dont want made
  patch_delete_pets
}

patch_delete_pets(){
  rm temp/pack/assets/not_enough_updates/custom_skull_textures/
}

main(){
  # check if furfsky.zip exists
  if [[ ! -f furfksky.zip ]]; then
    help
  fi
  # create temp directory assuming it does not exist
  if ! ls temp > /dev/null; then
    echo "temp does not exist, creating"
    mkdir temp
  else
    echo "temp already exists, exiting"
    exit
  fi

unzip furfsky.zip -d temp/pack

patch

if [[ $no_delete_temp == "false" ]]; then
 rm -r temp
fi
}

help(){
  echo "furfpatcher is an unofficial script meant to ease the modification of the furfsky texture pack"
  echo "to configure how it patches edit the script and find the patch function and comment any patches you dont want"
  exit
}

if [[ $show_help == "true" ]]; then
  help
else
  main
fi
