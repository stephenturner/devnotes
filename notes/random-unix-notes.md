Rename a bunch of badly named text files:

```bash
# Convert all spaces to dashes
rename 's/ /-/g' *.txt
# Optional: make everything lowercase
rename -fc *.txt
```
