# CRAN packages -----------------------------------------------------------

cran <- c(
  "addinslist",
  "assertr",
  "beepr",
  "caret",
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
  "here",
  "Hmisc",
  "janitor",
  "kableExtra",
  "knitr",
  "leaflet",
  "maps",
  "NMF",
  "pheatmap",
  "pkgdown",
  "ppclust",
  "printr",
  "proxy",
  "remedy",
  "rmarkdown",
  "roxygen2",
  "shiny",
  "styler",
  "tidyverse",
  "Tmisc",
  "VennDiagram",
  "viridis",
  "visNetwork",
  "yaml"
)


# Workshop packages -------------------------------------------------------

workshop <- c(
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
  "annotate",
  "AnnotationDbi",
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
install.packages("BiocManager")

# Set your CRAN mirror
options("repos" = c(CRAN = "https://cloud.r-project.org/"))


# Install them all
library(BiocManager)
# allpkgs <- c(cran, workshop, bioc, anno)
# system.time(install(allpkgs))
system.time(install(cran))
# system.time(install(workshop))
# system.time(install(bioc))
# system.time(install(anno))

# Check that it worked
for (p in cran) suppressPackageStartupMessages(library(p, character.only=TRUE))
# for (p in workshop) suppressPackageStartupMessages(library(p, character.only=TRUE))
# for (p in bioc) suppressPackageStartupMessages(library(p, character.only=TRUE))
# for (p in anno) suppressPackageStartupMessages(library(p, character.only=TRUE))


# GitHub ------------------------------------------------------------------

# devtools::install_github("stephenturner/Tmisc")
# devtools::install_github("stephenturner/annotables")
# devtools::install_github("stephenturner/hcop")
# devtools::install_github("hadley/emo")
