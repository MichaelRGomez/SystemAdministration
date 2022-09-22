#!/bin/bash

#argument variables
TDIR=$1
IDEN=$2

#checking if the arguments are null
if [ -z "$TDIR" ] || [ -z "$IDEN" ]
then
	echo "You need to provide two arguments for this script to work."
	echo "Usage: make-go-dir <root directory name> <identifier name>"
fi

#confirming creation with the user
echo "I am about to create a directory structure named *$TDIR*."
echo "Do you want me to continue? [Yes/no]"
read CONFIRMATION

if [ "$CONFIRMATION" == "no" ]
then
	echo "Abort."
	exit 1
fi

#creating the directory structure
echo "creating directory"
mkdir "$TDIR" "$TDIR"/bin "$TDIR"/cmd "$TDIR"/cmd/api "$TDIR"/internals "$TDIR"/migrations "$TDIR"/remote
touch "$TDIR"/cmd/api/main.go "$TDIR"/go.mod "$TDIR"/Makefile 

#adding the code to the main.go file
MAINFILE="$TDIR"/cmd/api/main.go

echo "// File: cmd/api/main.go" >> $MAINFILE
echo "" >> $MAINFILE
echo "package main" >> $MAINFILE
echo "" >> $MAINFILE
echo "import \"fmt\"" >> $MAINFILE
echo "" >> $MAINFILE
echo "func main(){" >> $MAINFILE
echo "fmt.Println(\"Hello world!\")" >> $MAINFILE
echo "}" >> $MAINFILE

#adding the identifier to go.mod
echo "$IDEN" >> "$TDIR"/go.mod

#final promt to the user
echo "I have created a *main.go* file for you to test the directory structure."
echo "Type *go run ./cmd/api/main.go at the root directory of your project to test your project."
echo "Thank you"
