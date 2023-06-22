#!/usr/bin/env bash
# Manages the Bachelor of Software Engineering cohort list of students.

while true;
do
    read -rp "What operation would you like to perform {Create|View|Delete|Update|Exit}: " name
    case $name in
	"Create")
	    read -rp "Enter student email: " email
	    read -rp "Enter student age: " age
	    read -rp "Enter student ID: " ID
	    echo "$email:$age:$ID" >>students-list_0333.txt
	    ;;
	"Delete")
	    read -rp "Enter student ID: " ID
            grep -v $ID < students-list_0333.txt > modified-students-list_0333.txt
            mv modified-students-list_0333.txt students-list_0333.txt
	    ;;
	"Update")
	    read -rp "Enter student ID for update: " ID
	    old=$(cat students-list_0333.txt | grep $ID)
	    if [ -z "$old" ];
	    then
                echo "No ID match found"
                continue
	    fi
            echo "$old"
	    read -rp "Enter new student email: " email
	    read -rp "Enter new student age: " age
	    new="$email:$age:$ID"
	    sed -i "s/$old/$new/g" students-list_0333.txt
	    ;;
	"View")
	    cat students-list_0333.txt
	    ;;
	"Exit")
	    break
	    ;;
	*)
	    ;;
    esac
done
