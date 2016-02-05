## Shell wrapper for bare jar files

If you've got a bare JAR file, instead of having to do something like this every time you want to call the software:

```bash
java -Xmx8G -jar /long/path/to/snpEff/snpEff.jar <arguments>
```

Instead, write a wrapper called `snpEff`, stick it in the snpEff directory:

```bash
#!/bin/bash
java -Xmx8G -jar $(dirname $0)/snpEff.jar $*
```

Then simply call:

```bash
snpEff <arguments>
```


## Rename a bunch of badly named text files:

```bash
# Convert all spaces to dashes
rename 's/ /-/g' *.txt
# Optional: make everything lowercase
rename -fc *.txt
```
