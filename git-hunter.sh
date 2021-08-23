#!/bin/bash

which bloodhound-cli > /dev/null 2>&1 || missing=1
if [[ $missing = "1" ]]; then 
	echo "Bloodhound-cli was not found and is required."
	echo 'Please confirm it is installed and available via your $PATH. Exiting now. '
	exit 1
else
	echo "Bloodhound-cli was found: $(which bloodhound-cli)"
fi





