#!/bin/bash

# for file in $(ls src/**); do
#   echo $file # this doesn't list files the way I need them
# done

# ls -R src | awk '
# /:$/&&f{s=$0;f=0}
# /:$/&&!f{sub(/:$/,"");s=$0;f=1;next}
# NF&&f{ print s"/"$0 }'

FILES=$(find src | grep .js$)
echo  > out.js
for file in ${FILES[@]}; do
  cat $file | awk -v header="\n// ###\n// ### File: ${file}\n// ###" 'BEGIN {print header} {print $0}' >> out.js
done
