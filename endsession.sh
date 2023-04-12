#!/bin/bash

# TODO: add a check to see if there are created files, not just modified ones
unaddedFiles=$(git ls-files -m)

if [ -n "$unaddedFiles" ]; then
    echo "You have unadded files:"
    echo "$unaddedFiles"

    read -p "Do you want to add and commit them? [y/n] " response
    if [[ $response =~ ^[Yy]$ ]]; then
        git add .
        read -p "Enter commit message: " message
        git commit -m "$message"

        echo "Files added and committed."

        read -p "Do you want to push? [y/n] " response
        if [[ $response =~ ^[Yy]$ ]]; then
            git push
            echo "Files pushed."
        else
            echo "Files not pushed."
        fi
    else
        echo "Files not added and therefore not committed."
    fi
fi

read -p "Do you want to kill all code editors? [y/n] " response
if [[ $response =~ ^[Yy]$ ]]; then
    killall code
    killall codium
    echo "All code editors killed."
fi

echo "Workday ended. Take a break and come back refreshed."
