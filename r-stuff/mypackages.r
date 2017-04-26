# CRAN --------------------------------------------------------------------

cranPkgs <- c(
  "base64enc",
  "bitops",
  "caTools",
  "d3heatmap",
  "data.table",
  "devtools",
  "evaluate",
  "formatR",
  "ggrepel",
  "gplots",
  "highcharter",
  "highr",
  "Hmisc",
  "jsonlite",
  "knitr",
  "leaflet",
  "maps",
  "markdown",
  "NMF",
  "rentrez",
  "rlist",
  "rmarkdown",
  "rprojroot",
  "shiny",
  "shinythemes",
  "tidyverse",
  "Tmisc",
  "VennDiagram",
  "viridis",
  "visNetwork",
  "XML",
  "yaml"
)

# Install them all
system.time(install.packages(cranPkgs))

# Check that it worked
for (p in cranPkgs) suppressPackageStartupMessages(library(p, character.only=TRUE))



# Bioconductor ------------------------------------------------------------

source("http://bioconductor.org/biocLite.R")

biocLite(suppressUpdates=TRUE)
library(BiocInstaller)

biocPkgs <- c(
  "affy",
  "annotate",
  "affy",
  "annotate",
  "arrayQualityMetrics",
  "beadarray",
  "biomaRt",
  "BSgenome.Hsapiens.UCSC.hg19",
  "BSgenome.Mmusculus.UCSC.mm9",
  "DESeq2",
  "edgeR",
  "genefilter",
  "GEOquery",
  "GO.db",
  "GOstats",
  "limma",
  "minfi",
  "oligo",
  "oligoClasses",
  "SPIA"
)

biocAnnoPkgs <- c(
  "hgu133a.db",
  "hgu133plus2.db",
  "hgu95av2.db",
  "pd.hugene.1.0.st.v1",
  "hugene10stv1cdf",
  "hugene10sttranscriptcluster.db",
  "pd.hugene.2.0.st",
  "hugene20sttranscriptcluster.db",
  "pd.mogene.1.0.st.v1",
  "mogene10stv1cdf",
  "mogene10sttranscriptcluster.db",
  "mogene10stprobeset.db",
  "mouse4302.db",
  "FDb.InfiniumMethylation.hg19",
  "IlluminaHumanMethylation450kmanifest",
  "IlluminaHumanMethylationEPICmanifest"
)


# Install them all
system.time(biocLite(c(biocPkgs, biocAnnoPkgs), suppressUpdates = TRUE))

# Check that it worked
for (p in c(biocPkgs, biocAnnoPkgs)) suppressPackageStartupMessages(library(p, character.only=TRUE))



# GitHub ------------------------------------------------------------------

devtools::install_github("hadley/emo")
devtools::install_github("stephenturner/annotables")
devtools::install_github("krlmlr/here")
devtools::install_github("tidyverse/glue")

