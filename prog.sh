#!/bin/sh

# prog.sh <print text: string> <condition command: string> [<repeat count: int>]
# e.g. prog.sh "Downloading" "[ ! -e /tmp/file ]" 10

[[ -z "$T" ]] && orig_text=$1 || orig_text=$T
[[ -z "$C" ]] && condition=$2 || condition=$C
[[ -z "$R" ]] && repeat=$3    || repeat=$R
[[ -z "$repeat" ]] && repeat=3

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
