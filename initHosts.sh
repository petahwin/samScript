#!/bin/bash
# SSHs into every zoo machine to add all machines into known hosts

if [ $# -ne 1 ]; then
  echo "usage: ./initHosts.sh userNetID"
  exit 1
fi

echo "initializing hosts for all non-problem machines"

# for mach_name in `cat problem_machines`
for mach_name in `cat machine_names.txt`
  do
    ssh $1@$mach_name.zoo.cs.yale.edu w >> out.txt 
  done

echo "finished initializing all non-problem machines"

exit 0

