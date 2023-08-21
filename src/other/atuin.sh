#!/bin/bash

if [[ $(env atuin --version 2&1> /dev/null) ]]; then
	eval "$(atuin init bash --disable-up-arrow)"
else
	echo "Please install atuin to have cool shell history"
	echo "See https://atuin.sh/"
fi
