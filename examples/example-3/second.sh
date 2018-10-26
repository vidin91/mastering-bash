if [ $# -gt 1 ]; then
  FILE_NAME=$1
  shift
else
  if [ $# -lt 1 ]; then
    echo "$0: invalid arguments"
    exit 1
  fi
fi

cat $FILE_NAME | awk -v city=$1 '$3 == city'