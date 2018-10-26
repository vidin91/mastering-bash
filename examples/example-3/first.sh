if [ $# -gt 1 ]; then
  FILE_NAME=$1
  shift
else
  if [ $# -lt 1 ]; then
    echo "$0: invalid arguments"
    exit 1
  fi
fi

# NOTE: If FILE_NAME is empty cat will take standard input
cat $FILE_NAME | awk -v limit=$1 '$4 >= limit { print $0 }'

# in awk script: since by default line is split by space on words, $4 is last word (salary).
# $0 in awk script means "whole line"