#!/bin/bash

read -e -p "Enter company name: " -i "3D Group" COMPANY_FRIENDLY_NAME
read -e -p "Enter company name in lower case: " -i "3d-group" COMPANY
read -e -p "Enter repository name: " -i "unity-simple-notifications" REPOSITORY_NAME
read -e -p "Enter friendly name: " -i "Notifications" FRIENDLY_NAME
read -e -p "Enter description: " -i "Package for Unity game engine." DESCRIPTION
read -e -p "Enter unity version: " -i "2019.4" UNITY_VERSION

echo 'Replacing template strings...'

( shopt -s globstar dotglob;
    for file in **; do
        if [[ -f $file ]] && [[ -w $file ]] && [[ $file != 'RUNME.sh' ]] && [[ $file != Samples/** ]] && [[ $file != .git/** ]]; then
		    echo "Altering file ${file}"
            replace="s/{{REPOSITORY_NAME}}/"${REPOSITORY_NAME}"/g;s/{{FRIENDLY_NAME}}/"${FRIENDLY_NAME}"/g;s/{{DESCRIPTION}}/"${DESCRIPTION}"/g;s/{{UNITY_VERSION}}/"${UNITY_VERSION}"/g;s/{{COMPANY}}/"${COMPANY}"/g;s/{{COMPANY_FRIENDLY_NAME}}/"${COMPANY_FRIENDLY_NAME}"/g"
			
			# Replace template strings inside files
			sed -i -- $replace "$file"
			
			# Replace template strings on file names
			newfile="$(echo ${file} |sed -e ${replace})"
			mv "${file}" "${newfile}"
        fi
    done
)

echo 'done.'

# Remove template repository specific files
rm README.md
mv example-README.md README.md
mv example-.github .github
rm RUNME.sh
