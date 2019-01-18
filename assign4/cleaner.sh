#!/bin/bash
#
#Programmer Cristian Aguirre
#
#Purporse: Program gives the option to delete a file from current directory and even
#delete a file by a string within that file. 
##########################
askDelete() { #ask delete function

	echo " "
	echo "$1 was found,do you still want to delete? (y/n)"

	read insert
	if [ $insert == 'y' ] || [ $insert == 'Y' ] ;
	then
	rm -r $1
	echo "file has been removed."


	else
	echo "file has NOT been removed"
		exit
		fi
}
#################################################
clear
echo "Welcome to the CLEANER program!"

directory=`pwd`
while :
 do
echo "Enter 1 to delete by filename or word file."
echo "Enter 2 to delete by a string within the file."
echo "Enter 3 or quit to exit this program."
echo " "
echo " "
 read -p "Please type in your number: " number
case $number in
	1)
		echo "Enter in the name of the file to delete: "
		echo " "
		read file

		result=$(find $directory -name "$file")

		if [ -f "$result" ];
		then
		askDelete $file

		else
		echo "File not found. "

		exit
		fi
		 ;;
	2)
		read -p "Enter the string to delete files that contain it: " searchstring
		result=$(find $directory -type f)
		for entry in $result

		do
		grep -q "$searchstring" "$entry"

		if [ $? -eq 0 ];
		then
		echo found string
		askDelete $result

		else

		echo "File was not found"
		exit
		fi
		done
		 ;;
	3)
		exit 1
		 ;;
esac
done
