#!/bin/bash

# Check that the script is running in correct director by checking that .git and Runtime folders exist
if [ ! -f "RUNME.sh" ] || [ ! -d "Runtime" ]
then
    echo 'ERR: You must be in the repository root to run this script.'
	echo '(no Runtime folder or RUNME.sh found)'
    exit 1
fi

read -e -p "Company name: " -i "3D Group" COMPANY_FRIENDLY_NAME
read -e -p "Company name in lower case: " -i "3d-group" COMPANY
read -e -p "Unacceptable behavior may be reported at: " -i "reports@3d.fi" REPORT_EMAIL
read -e -p "Company website: " -i "https://3d.fi" COMPANY_WEBSITE
read -e -p "Repository name: " -i "unity-simple-notifications" REPOSITORY_NAME
read -e -p "Friendly name: " -i "Notifications" FRIENDLY_NAME
read -e -p "Description: " -i "Package for Unity game engine." DESCRIPTION
read -e -p "Unity version: " -i "2019.4" UNITY_VERSION

# Escape special characters for input to be used in sed
COMPANY_FRIENDLY_NAME=$(echo "$COMPANY_FRIENDLY_NAME" | sed -e 's/[]\/$*.^[]/\\&/g');
COMPANY=$(echo "$COMPANY" | sed -e 's/[]\/$*.^[]/\\&/g');
REPORT_EMAIL=$(echo "$REPORT_EMAIL" | sed -e 's/[]\/$*.^[]/\\&/g');
COMPANY_WEBSITE=$(echo "$COMPANY_WEBSITE" | sed -e 's/[]\/$*.^[]/\\&/g');
REPOSITORY_NAME=$(echo "$REPOSITORY_NAME" | sed -e 's/[]\/$*.^[]/\\&/g');
FRIENDLY_NAME=$(echo "$FRIENDLY_NAME" | sed -e 's/[]\/$*.^[]/\\&/g');
DESCRIPTION=$(echo "$DESCRIPTION" | sed -e 's/[]\/$*.^[]/\\&/g');
UNITY_VERSION=$(echo "$UNITY_VERSION" | sed -e 's/[]\/$*.^[]/\\&/g');

echo 'Replacing template strings...'

# Get current year for license, etc. 2021
YEAR="$(date +'%Y')"

# Form sed command and store it into a file. Ran into problems with white spaces when trying to pass this as parameter. 
echo "s/{{REPOSITORY_NAME}}/"${REPOSITORY_NAME}"/g;s/{{FRIENDLY_NAME}}/"${FRIENDLY_NAME}"/g;s/{{DESCRIPTION}}/"${DESCRIPTION}"/g;s/{{UNITY_VERSION}}/"${UNITY_VERSION}"/g;s/{{COMPANY}}/"${COMPANY}"/g;s/{{COMPANY_FRIENDLY_NAME}}/"${COMPANY_FRIENDLY_NAME}"/g;s/{{YEAR}}/"${YEAR}"/g;s/{{COMPANY_WEBSITE}}/"${COMPANY_WEBSITE}"/g;s/{{REPORT_EMAIL}}/"${REPORT_EMAIL}"/g" > temp.txt

( shopt -s globstar dotglob;
    for file in **; do
        if [[ -f $file ]] && [[ -w $file ]] && [[ $file != 'RUNME.sh' ]] && [[ $file != 'temp.txt' ]] && [[ $file != Samples/** ]] && [[ $file != .git/** ]]; then
		    echo "Altering file ${file}"

			# Replace template strings inside files
			sed -i -f temp.txt "$file"
			
			# Replace template strings on file names
			newfile="$(echo ${file} |sed -f temp.txt)"
			mv "${file}" "${newfile}"
        fi
    done
)

rm temp.txt
echo 'done.'
echo 'Removing template repository specific files...'

# Remove template repository specific files
rm README.md
rm CONTRIBUTING.md
rm LICENSE
rm package.json
rm .github/CODEOWNERS
rmdir .github
mv templates/README.md README.md
mv templates/CONTRIBUTING.md CONTRIBUTING.md
mv templates/LICENSE LICENSE
mv templates/package.json package.json
mv templates/.github .github

rmdir templates

echo 'done.'
rm RUNME.sh

exit 0

