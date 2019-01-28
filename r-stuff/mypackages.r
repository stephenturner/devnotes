# CRAN packages -----------------------------------------------------------

cran <- c(
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
  "Hmisc",
  "janitor",
  "jsonlite",
  "knitr",
  "leaflet",
  "maps",
  "markdown",
  "NMF",
  "openxlsx",
  "pheatmap",
  "pkgdown",
  "ppclust",
  "printr",
  "proxy",
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


# Workshop packages -------------------------------------------------------

work <- c(
  "mice",
  "caret",
  "randomForest",
  "gbm",
  "kknn",
  "glmnet",
  "survminer",
  "RTCGA",
  "RTCGA.clinical",
  "RTCGA.mrna"
)


# Bioconductor packages ---------------------------------------------------

# Software packages
bioc <- c(
  # "affy",
  "annotate",
  "AnnotationDbi",
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
anno <- c(
  "BSgenome.Hsapiens.UCSC.hg19",
  "BSgenome.Hsapiens.UCSC.hg38",
  "BSgenome.Mmusculus.UCSC.mm9",
  "BSgenome.Mmusculus.UCSC.mm10",
  "TxDb.Hsapiens.UCSC.hg19.knownGene",
  "TxDb.Hsapiens.UCSC.hg38.knownGene",
  "TxDb.Mmusculus.UCSC.mm9.knownGene",
  "TxDb.Mmusculus.UCSC.mm10.knownGene",
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


# Install & test ----------------------------------------------------------

# Do this once
# install.packages("BiocManager")

# Set your CRAN mirror
options("repos" = c(CRAN = "https://cloud.r-project.org/"))

allpkgs <- c(cran, work, bioc, anno)

# Install them all
library(BiocManager)
system.time(install(allpkgs))

# Check that it worked
for (p in cran) suppressPackageStartupMessages(library(p, character.only=TRUE))
for (p in work) suppressPackageStartupMessages(library(p, character.only=TRUE))
for (p in bioc) suppressPackageStartupMessages(library(p, character.only=TRUE))
for (p in anno) suppressPackageStartupMessages(library(p, character.only=TRUE))


# GitHub ------------------------------------------------------------------

# devtools::install_github("stephenturner/Tmisc")
devtools::install_github("stephenturner/annotables")
devtools::install_github("stephenturner/hcop")
devtools::install_github("hadley/emo")
devtools::install_github("ThinkR-open/remedy") # https://github.com/ThinkR-open/remedy
