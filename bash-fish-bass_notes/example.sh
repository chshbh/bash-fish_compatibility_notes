#!/bin/sh
# define functions here for bash env 
bash_func () 
{
	mkdir -p "$1"
	cd "$1"
	pwd
	cd ..
	rmdir "$1"
	echo "exiting bash shell"
}