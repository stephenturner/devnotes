# Make sure you run this first:
# if (dir.exists("/Rtmp")) Sys.setenv(TMPDIR="/Rtmp")
# Or put this in .bashrc
# echo 'if (dir.exists("/Rtmp")) Sys.setenv(TMPDIR="/Rtmp")' >> .Rprofile

install.packages("tidyverse")
install.packages("knitr")
install.packages("rmarkdown")
install.packages("devtools")

# install.packages("BiocManager")
# BiocManager::install()

# See also:
# https://github.com/stephenturner/devnotes/blob/master/r-stuff/mypackages.r
