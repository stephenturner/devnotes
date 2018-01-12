# Make sure you run this first:
# if (dir.exists("/Rtmp")) Sys.setenv(TMPDIR="/Rtmp")
# Or put this in .bashrc
# echo 'if (dir.exists("/Rtmp")) Sys.setenv(TMPDIR="/Rtmp")' >> .Rprofile

install.packages("tidyverse")
install.packages(("knitr", "rmarkdown"))
install.packages("devtools")

source("https://bioconductor.org/biocLite.R")
biocLite()
biocLite("limma")
biocLite("DESeq2")

# See also:
# https://github.com/stephenturner/devnotes/blob/master/r-stuff/mypackages.r