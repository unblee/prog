#!/bin/sh

# progress <print text: string> <condition command: string> [<repeat count: int>]
# e.g. progress.sh "Downloading" "[ ! -e /tmp/file ]" 10

orig_text=$1
condition=$2
repeat
[ -z $3 ] && repeat=3 || repeat=$3

while `eval ${condition}`
do
  for i in `seq ${repeat}`
  do
    text="${orig_text}"
    for j in `seq ${i}`; do text="${text}."; done
    echo -en "\r" && echo -n ${text}
    sleep 0.3
    echo -en "\r" && echo -n ${text} | sed "s/./ /g"
  done
done
