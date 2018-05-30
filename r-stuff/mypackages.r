# CRAN --------------------------------------------------------------------

cranPkgs <- c(
  "addinslist",
  "assertr",
  "base64enc",
  "beepr",
  "bitops",
  "caTools",
  "clipr",
  "datapasta",
  "d3heatmap",
  "data.table",
  "devtools",
  "diffobj",
  "DT",
  "factoextra",
  "formatR",
  "ggrepel",
  "gplots",
  "heatmaply",
  "here",
  "highcharter",
  "highr",
  "Hmisc",
  "janitor",
  "jsonlite",
  "knitr",
  "leaflet",
  "maps",
  "markdown",
  "networkD3",
  "NMF",
  "openxlsx",
  "pheatmap",
  "pkgdown",
  "ppclust",
  "printr",
  "proxy",
  "rentrez",
  "rjson",
  "rlist",
  "rmarkdown",
  "roxygen2",
  "shiny",
  "styler",
  "Seurat",
  "tidyverse",
  "Tmisc",
  "VennDiagram",
  "viridis",
  "visNetwork",
  "writexl",
  "XML",
  "yaml"
)

# Set your CRAN mirror
options("repos" = c(CRAN = "https://cloud.r-project.org/"))

# Install them all
system.time(install.packages(cranPkgs))

# Check that it worked
for (p in cranPkgs) suppressPackageStartupMessages(library(p, character.only=TRUE))



# Bioconductor ------------------------------------------------------------

# Basic Bioconductor installation
source("http://bioconductor.org/biocLite.R")
biocLite(suppressUpdates=TRUE)
library(BiocInstaller)

# Software packages
biocPkgs <- c(
  # "affy",
  "annotate",
  # "arrayQualityMetrics",
  # "beadarray",
  "biomaRt",
  "clusterProfiler",
  "DESeq2",
  "edgeR",
  "gage",
  "gageData",
  "genefilter",
  "ggtree",
  "GEOquery",
  "GOstats",
  "limma",
  "minfi",
  # "oligo",
  # "oligoClasses",
  "pathview",
  "SPIA",
  "tximport"
)

# Annotation packages
biocAnnoPkgs <- c(
  "BSgenome.Hsapiens.UCSC.hg19",
  "BSgenome.Hsapiens.UCSC.hg38",
  "BSgenome.Mmusculus.UCSC.mm9",
  "BSgenome.Mmusculus.UCSC.mm10",
  # "hgu133a.db",
  # "hgu133plus2.db",
  # "hgu95av2.db",
  # "pd.hugene.1.0.st.v1",
  # "hugene10stv1cdf",
  # "hugene10sttranscriptcluster.db",
  # "pd.hugene.2.0.st",
  # "hugene20sttranscriptcluster.db",
  # "pd.mogene.1.0.st.v1",
  # "mogene10stv1cdf",
  # "mogene10sttranscriptcluster.db",
  # "mogene10stprobeset.db",
  # "mouse4302.db",
  # "FDb.InfiniumMethylation.hg19",
  # "IlluminaHumanMethylation450kmanifest",
  # "IlluminaHumanMethylationEPICmanifest",
  "GO.db"
)


# Install them all
system.time(biocLite(c(biocPkgs, biocAnnoPkgs), suppressUpdates = TRUE))

# Check that it worked
for (p in c(biocPkgs, biocAnnoPkgs)) suppressPackageStartupMessages(library(p, character.only=TRUE))



# GitHub ------------------------------------------------------------------

# devtools::install_github("stephenturner/Tmisc")
devtools::install_github("stephenturner/annotables")
devtools::install_github("stephenturner/hcop")
devtools::install_github("hadley/emo")
devtools::install_github("ThinkR-open/remedy") # https://github.com/ThinkR-open/remedy
