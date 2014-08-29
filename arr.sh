#!/bin/bash

# shopt -s nullglob
array=(asciiArt/*)
len=${#array[@]}
# for a in "${array[@]}"
#   do
#     echo $a
#   done
#
echo $len
echo ${array[$(($RANDOM % $len))]} 
