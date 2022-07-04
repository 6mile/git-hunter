# git-hunter
Find threats in source code

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

## Use Gitleaks to find embedded secrets

### run gitleaks against all commits and point it at local directory
```gitleaks -v --depth=$(git rev-list HEAD --count) -p ./```

### run gitleaks against a github url
```gitleaks -v -r https://github.com/juice-shop/juice-shop.git```


