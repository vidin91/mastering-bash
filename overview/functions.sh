# basic function
function getMessage() {
  echo "Hello world!"
}

# with arguments and return value
# bash functions don't support standart concept of returned value back to the calling location.
# They are like scripts inside scripts - echo inside function is not like console.log in JavaScript.
# echoing sends value to the function's standard output
getGreetingMessage() {
  echo "Hi, $1, greeting!" # return value of the function
  return 0 # return status - similar to programs: 0 - no error, !=0 error
}

OUTPUT=$(getGreetingMessage Milos)
echo $? # $? gives return status of the previously run command
echo $OUTPUT # Hi, Milos, greeting!


# Local variables
function testingScope() {
  USER=Milos
  local CONSTANT=10 # like var in JavaScript
}

testingScope
echo $USER # Milos
echo $CONSTANT # it's empty

# overriding commands
ls() {
  command ls -lh
}

ls