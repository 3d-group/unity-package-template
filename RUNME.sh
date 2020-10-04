#!/bin/bash

read -p "Enter repository name (eg. unity-simple-notifications): " REPOSITORY_NAME
read -p "Enter friendly name (eg. Notifications): " FRIENDLY_NAME
read -p "Enter description (eg. Simple UI notifications for Unity game engine.): " DESCRIPTION
read -p "Enter unity version (eg. 2019.4): " UNITY_VERSION

echo 'Replacing template strings...'

( shopt -s globstar dotglob;
    for file in **; do
        if [[ -f $file ]] && [[ -w $file ]] && [[ $file != 'RUNME.sh' ]] && [[ $file != 'Samples/**' ]] && [[ $file != '.git/**' ]]; then
		    echo "Altering file ${file}"
            sed -i -- 's/{{REPOSITORY_NAME}}/"${REPOSITORY_NAME}"/g;s/{{FRIENDLY_NAME}}/"${FRIENDLY_NAME}"/g;s/{{DESCRIPTION}}/"${DESCRIPTION}"/g;s/{{UNITY_VERSION}}/"${UNITY_VERSION}"/g' "$file"
        fi
    done
)

echo 'done.'
