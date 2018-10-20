#!/bin/bash

####### working with variables #######
# by convertion, uppercase

NAME=Milos # can't have spaces around =
LAST_NAME="Milenovic" # same
FULL_ID=\($NAME$LAST_NAME\) # (MilosMilenovic) - can't have spaces between words
FULL_ID="($NAME $LAST_NAME)" # (Milos Milenovic)

####### arithmetic: command let expression , shorthand ((expression)); #######
# command expr
NUM1=10
let NUM1+=10  # NUM1 = 20

((NUM2    = 2 +    2)) # NUM2 = 4

NUM3=`expr 2 \* 5` # NUM3 = 10

# let N=2   + 10 - let: +: syntax error: operand expected (error token is "+")

let RESULT=2*10+20-4 # RESULT = 36
let "RESULT   =  2 *10-2 +    5" # RESULT = 23
RESULT=$(( 2 + 10)) # RESULT = 12

####### ARRAYS #######
NAMES=(Milos Marko Stanko)

NAME=${NAMES[1]} # NAME=Marko

DAYS[1]=TUE
DAYS[2]=WED # DAYS[0] is empty

####### test <EXPRESSION> #######
# This command allows you to do various
# tests and sets its exit code to 0 (TRUE) or 1 (FALSE) whenever such a test succeeds or not.

test 10 -gt 2 # it's true, exit status is zero
STATUS=$? # STATUS=0 $? returns status of previous command

test -z Milos # false, status code: 1
test milos = milos # true
### IMPORTANT: test milos -eq milos - won't work since -eq is for arithmetic operations
test milos != milenovic
# shorthand: [ expression ] - note: spaces arround expression
STR1=Milos
STR2=Marko
if [ "$STR1" != "$STR2" ]
then
  STATUS=DIFFERENT  # status is: DIFFERENT
else
  STATUS="THE SAME"
fi

NUM=10
#if [ 5 -lt $NUM -a $NUM -lte 20 ] - this doesn't work. Why?
if ((5  < $NUM && $NUM < 20)) # this is not supported by POSIX shells???
then
  STATUS=0 # true, so status=0
fi

####### LOOPS #######
NAMES=("MILOS" "MARKO" "STANKO")

# echo $NAMES : output MILOS
# echo $NAMES[1]: output MILOS[1]
# for name in "MILOS" "MARKO".... - this would WAE (work as expected)

for name in ${NAMES[@]}
do
  `` # echo $name
done


LENGTH=${#NAMES[@]} # LENGTH = 3

for (( i=1; i<=$LENGTH; i++))  # ?????
do
  `` # echo $i
done

##### QUOTES #####
# by default, space separates items
# if we want more complex string (with spaces), we need quotes
# Single quotes: treat every character literaly
# double qoutes: allow substitution
SOME_VAL=10
STR1="value: $SOME_VAL" # STR1: value: 10
STR2='value: $SOME_VAL' # STR2: value: $SOME_VAL


##### READ #####
# -p : to set prompt, -s: silent (typing is not visible)

# read -p 'Username: ' uservar
# read -sp 'Password: ' passvar
# echo
# echo Thankyou $uservar we now have your login details

##### LENGTH of variable #####
VAL="HELLO WORLD"
LENGTH=${#VAL} # LENGTH = 11
VAL=102400
LENGTH=${#VAL} # LENGTH = 6
