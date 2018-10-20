#!/bin/bash
PS3="Select action:"

select action in "sum" "exit"
do
  if [ $action = exit ]
  then
    break
  fi

  read -p "Enter array's size: " SIZE
  SUM=0
  for i in $(seq 1 $SIZE) # in {1..$SIZE} not working. Don't know why
  do
    read -p "elem-$i: " N
    let SUM+=N
  done
  echo "THE SUM IS: $SUM"
done
