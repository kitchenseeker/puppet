#!/bin/bash
list_node=($(/usr/bin/puppet cert list --all | egrep -o '"appnode.*"' | sed 's/\"//g'))

for i in ${list_node[@]}
  do
    counter=0
    reachable=0
    while [ $counter -lt 5 ]
      do
        /bin/ping -c1 $i > /dev/null 2>&1
        rcode="$?"
        if [ $rcode == 0 ];then
          reachable=0
        else
          ((reachable++))
        fi
        ((counter++))
      done
    if [ $reachable != 0 ]; then
      /usr/bin/puppet cert clean $i
    fi
  done
