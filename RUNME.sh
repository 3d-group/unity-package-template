#!/bin/bash

read -e -p "Company name: " -i "3D Group" COMPANY_FRIENDLY_NAME
read -e -p "Company name in lower case: " -i "3d-group" COMPANY
read -e -p "Unacceptable behavior may be reported at: " -i "reports@3d.fi" REPORT_EMAIL
read -e -p "Company website: " -i "https://3d.fi" COMPANY_WEBSITE
read -e -p "Repository name: " -i "unity-simple-notifications" REPOSITORY_NAME
read -e -p "Friendly name: " -i "Notifications" FRIENDLY_NAME
read -e -p "Description: " -i "Package for Unity game engine." DESCRIPTION
read -e -p "Unity version: " -i "2019.4" UNITY_VERSION

echo 'Replacing template strings...'

YEAR="$(date +'%Y')"

( shopt -s globstar dotglob;
    for file in **; do
        if [[ -f $file ]] && [[ -w $file ]] && [[ $file != 'RUNME.sh' ]] && [[ $file != Samples/** ]] && [[ $file != .git/** ]]; then
		    echo "Altering file ${file}"
            replace="s/{{REPOSITORY_NAME}}/"${REPOSITORY_NAME}"/g;s/{{FRIENDLY_NAME}}/"${FRIENDLY_NAME}"/g;s/{{DESCRIPTION}}/"${DESCRIPTION}"/g;s/{{UNITY_VERSION}}/"${UNITY_VERSION}"/g;s/{{COMPANY}}/"${COMPANY}"/g;s/{{COMPANY_FRIENDLY_NAME}}/"${COMPANY_FRIENDLY_NAME}"/g;s/{{YEAR}}/"${YEAR}"/g;s/{{COMPANY_WEBSITE}}/"${COMPANY_WEBSITE}"/g;s/{{REPORT_EMAIL}}/"${REPORT_EMAIL}"/g"
			
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
rm CONTRIBUTING.md
rm LICENSE
rm package.json
mv example-README.md README.md
mv example-CONTRIBUTING.md CONTRIBUTING.md
mv example-LICENSE LICENSE
mv example-package.json package.json
mv example-.github .github
rm RUNME.sh
