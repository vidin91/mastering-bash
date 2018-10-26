## Bash examples

**example-1**  
User is asked to pass size of reading array, and then to enter numbers. Program sums numbers and prints result.  
User can select to exit or to continue with another array.

**example-2**  
There is src folder that contains files. take all JS files (there are other types as well) and merge them in one file. Also, before each segment, in resulting file, there should be header that says `# File: ${filename}`

**example-3**  
__pipelines__  
File input.txt contains entries in format: `first_name last_name City salary`. Script `first.sh` takes input file in the same format, and _salary_ argument, and passes all users that have higher salary than _salary_. Script `second.sh` takes only users from the _city_ that is passed to the script. Also, both scripts can take input file name as argument - if two args are passed, the first is filename.
