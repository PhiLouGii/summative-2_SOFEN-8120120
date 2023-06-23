#!/usr/bin/env bash
# Manages the Bachelor of Software Engineering cohort list of students.

while true; do
    echo "Please select an option:"
    echo "1. Create a student record"
    echo "2. View all students"
    echo "3. Delete a student"
    echo "4. Update a student record"
    echo "5. Exit"

    read choice

    case $choice in
        1)
            echo "Enter student email:"
            read email
            echo "Enter student age:"
            read age
            echo "Enter student ID:"
            read id

            echo "$email $age $id" >> students-list_0333.txt
            ;;
        2)
            cat students-list_0333.txt
            ;;
        3)
            echo "Enter student ID to delete:"
            read id

            sed -i "/$id/d" students-list_0333.txt
            ;;
        4)
            echo "Enter student ID to update:"
            read id

            sed -i "/$id/d" students-list_0333.txt

            echo "Enter updated student email:"
            read email
            echo "Enter updated student age:"
            read age
            echo "Enter updated student ID:"
            read id

            echo "$email $age $id" >> students-list_0333.txt
            ;;
        5)
            exit 0
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
done
