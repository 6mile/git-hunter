# git-hunter
Find threats in source code

## Pre-requisites:

### github-subdomains
The obvious use here is to find subdomains in GitHub repositories, but this also will find the developers working on those projects.
https://github.com/gwen001/github-subdomains

### gitleaks
This is the best way to find sensitive data exposure in git repos

## Working with JSON and jq

### use jq to sort by two columns and use the csv format
```jq -r '.secrets[] | [.file, .offender] | @csv' ./scanresults/file01.json | sort -u```

### use jq to pull all relevant fields for CSV report
```jq -r '.secrets[] | [.file, .rule, .lineNumber, .commit, .author, .date, .offender] | @csv' ./file02.json > file02-report.csv```

### use jq to remove the line file from bloodhound-cli
```jq 'del(.secrets[].line)' ./file03.json```

## Interact with git

### See all developers that have worked in this repo
```git shortlog -sne```

### use git to search all commits 
```git grep "password=" `git show-ref --heads` ```

### count number of commits in history
```git rev-list HEAD --count```


## Audit Git Commit Signing GPG

### See the GPG signature details for last commit
```git log --show-signature -1```

### See the GPG details for ALL commits
```git log --show-signature```

## Use Gitleaks to find embedded secrets

### run gitleaks against all commits and point it at local directory
```gitleaks -v --depth=$(git rev-list HEAD --count) -p ./```

### run gitleaks against a github url
```gitleaks -v -r https://github.com/juice-shop/juice-shop.git```

### find GitHub username via uid
```curl https://api.github.com/user/106486165```

## Use regex to find sensitive details in files

### find emails in all files 
```find ./ -exec grep -si -o '[A-Z0-9._%+-]\+@[A-Z0-9.-]\+\.[A-Z]\{2,4\}' {} \;```
