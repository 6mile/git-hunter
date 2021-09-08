# git-hunter
Find threats in your source code

## jq tricks

### use jq to sort by two columns and use the csv format
```jq -r '.secrets[] | [.file, .offender] | @csv' ./scanresults/file01.json | sort -u```

### use jq to pull all relevant fields for CSV report
```jq -r '.secrets[] | [.file, .rule, .lineNumber, .commit, .author, .date, .offender] | @csv' ./file02.json > file02-report.csv```

### use jq to remove the line file from bloodhound-cli
```jq 'del(.secrets[].line)' ./file03.json```

### use git to search all commits 
```git grep "password=" `git show-ref --heads` ```

### count number of commits in history
```git rev-list HEAD --count```
