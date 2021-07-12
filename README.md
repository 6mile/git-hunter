# git-hunter
Find threats in your source code

## jq tricks
### use jq to sort by two columns and use the csv format
```jq -r '.secrets[] | [.file, .offender] | @csv' ./scanresults/tieto.json | sort -u```
