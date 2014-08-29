#!/bin/bash
# Probes for given netID on all zoo machines

# use `ssh -o PasswordAuthentication=no -o setTimeout=2 flags to deal
# with any case of misbehaving zoo machines`

# initialization 
LOGFILE=probe.log
asciiArr=(asciiArt/*)
len=${#asciiArr[@]}


# define logger
log () {
  echo $(date)": $1" >> $LOGFILE 
}

# check params
if [ $# -ne 2 ]; then
  echo "usage: ./probe.sh myNetID targetNetID" 
  exit 1
fi

# Begin probing
echo =============== >> $LOGFILE
log "start probing for netID $2 using netID $1"
for mach_name in `cat machine_names.txt`; do
  OUT=`ssh $1@$mach_name.zoo.cs.yale.edu w | grep "$2"`
  if [ $? -eq 0 ]; then
    log "found $2 on $mach_name with TTY: `grep 'pts[^ ]*' -o <<< $OUT`"
	
    ssh $1@$mach_name.zoo.cs.yale.edu write $2 $TTY \
    <<< "Peter's important message"

    file=${asciiArr[$(($RANDOM % $len))]}
#    sleep 2
    ssh $1@$mach_name.zoo.cs.yale.edu write $2 $TTY < $file
    log "Sent $file" 
  fi
done

log "completed probing for netID $2"

exit 0

