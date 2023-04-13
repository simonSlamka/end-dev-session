#!/bin/bash

function process_repo() {
    repo="$1"
    echo "Processing repo: $repo"

    pushd "$repo" > /dev/null

    unaddedFiles=$(git status --porcelain=v1 | awk '{print $2}')

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

    popd > /dev/null
}

if [ "$1" == "-r" ] && [ -n "$2" ]; then
    rootDir=$2
    for repo in "$rootDir"/*; do
        if [ -d "$repo" ] && [ -d "$repo/.git" ]; then
            process_repo "$repo"
        fi
    done
else
    process_repo "$(pwd)"
fi

read -p "Do you want to kill all code editors? [y/n] " response
if [[ $response =~ ^[Yy]$ ]]; then
    killall code
    killall codium
    echo "All code editors killed."
fi

echo "Workday ended. Take a break and come back refreshed."
