# CRAN --------------------------------------------------------------------

options("repos" = c(CRAN = "https://cloud.r-project.org/"))
cran <- c(
  "assertr",
  "beepr",
  "BiocManager",
  "clipr",
  "data.table",
  "datapasta",
  "devtools",
  "DT",
  "flextable",
  "ggrepel",
  "here",
  "janitor",
  "kableExtra",
  "knitr",
  "leaflet",
  "maps",
  "pkgdown",
  "remedy",
  "rmarkdown",
  "roxygen2",
  "shiny",
  "skater",
  "tidymodels",
  "tidyverse",
  "Tmisc",
  "yaml"
)
install.packages(cran)
for (p in cran) suppressPackageStartupMessages(library(p, character.only=TRUE))


# GitHub ------------------------------------------------------------------

# Requires GITHUB_PAT set in ~/.Renviron
gh <- c(
  "MilesMcBain/breakerofchains",
  "signaturescience/fiphde"
)
remotes::install_github(gh, upgrade=FALSE)


# Bioconductor ------------------------------------------------------------

# Minimal
if (!require("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install()
BiocManager::install("Biostrings", ask=FALSE, update=FALSE)

# bioc_all <- c(
#   "annotate",
#   "AnnotationDbi",
#   "biomaRt",
#   "clusterProfiler",
#   "DESeq2",
#   "edgeR",
#   "gage",
#   "gageData",
#   "genefilter",
#   "ggtree",
#   "GEOquery",
#   "GOstats",
#   "limma",
#   "minfi",
#   "pathview",
#   "SPIA",
#   "tximport"
# )
# BiocManager::install(bioc_all)
# for (p in bioc_all) suppressPackageStartupMessages(library(p, character.only=TRUE))

# bioc_anno <- c(
#   "BSgenome.Hsapiens.UCSC.hg19",
#   "BSgenome.Hsapiens.UCSC.hg38",
#   "BSgenome.Mmusculus.UCSC.mm9",
#   "BSgenome.Mmusculus.UCSC.mm10",
#   "TxDb.Hsapiens.UCSC.hg19.knownGene",
#   "TxDb.Hsapiens.UCSC.hg38.knownGene",
#   "TxDb.Mmusculus.UCSC.mm9.knownGene",
#   "TxDb.Mmusculus.UCSC.mm10.knownGene",
#   "GO.db"
# )
# BiocManager::install(bioc_anno)
# for (p in bioc_anno) suppressPackageStartupMessages(library(p, character.only=TRUE))
