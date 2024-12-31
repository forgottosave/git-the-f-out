#!/usr/bin/env bash

home_dir="/home/$(whoami)"
install_dir="$home_dir/bin"

mkdir "$install_dir"
cp -r ./src/gtfo.sh "$install_dir/gtfo"

# make sure add to PATH
#echo "PATH=$PATH:$install_dir/"
