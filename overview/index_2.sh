#!/bin/bash

###
### CAT
###
# To display file's content, to combine files and to create new ones

# cat index_1.sh index_2.sh - outputs two files concatenated

# sort - sorts lines from input stream
# wc - count bytes, words and lines from input file, -l for lines
NUM_OF_LINES=$(cat index_2.sh | wc -l)

###
### grep - global regular expression print
###
# This command processes text line by line and prints any lines which match a specified pattern.
# syntax: grep [OPTIONS] PATTERN [FILE...]

OUTPUT=$(grep -i milenovic index_1.sh) # prints all lines that containt word milenovic, -i to ignore cases

###
### tr
###
# tr command automatically translates (substitutes, or maps) one set of characters to another.
# syntax: tr [-Ccsu] string1 string2

# In this form, the characters in the string string1 are translated into the characters in string2 where 
# the first character in string1 is translated into the first character in string2 and so on. If string1 is
# longer than string2, the last character found in string2 is duplicated until string1 is exhausted.

OUTPUT=$(echo "Milos Milenovic" | tr "a-z" "A-Z") # MILOS MILENOVIC
OUTPUT=$(echo "Milos Milenovic" | tr -d Mos) # il ilenvic (deletes characters from string1)

# can't use regex for strings, but possible [:class:] etc. 

###
### cut : TODO!!!!!!!!!!!
###

###
### sed
###
# sed, short for "stream editor", allows you to filter and transform text - line by line
# syntax: sed OPTIONS... [SCRIPT] [INPUTFILE...]
# If you do not specify INPUTFILE, or if INPUTFILE is "-", sed filters the contents of the standard input
# most common use: The s Command (which stands for "substitute"):
# 's/regexp/replacement/flags'.

# & - represents the matched string, can be referenced in replacement
# NOTE: +, ?, {n,m} have the same meaning like in JavaScript regex except you have to escape them with \

OUTPUT=$(echo 123milos22test | sed 's/[0-9]\+/(&)/g') # (123)milos(22)test
# 's/[0-9]\+//g' - this would strip out numbers - since replacement is empty

# If I use grouping in regex, I can reference parts with \1, \2 etc. instead of &
echo "milos milenovic" | sed 's/\([a-z]\+\) \([a-z]\+\)/\2 \1/' # milenovic milos

