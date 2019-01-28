# CRAN packages -----------------------------------------------------------

cran <- c(
  "data.table",
  "devtools",
  "diffobj",
  "DT",
  "ggrepel",
  "here",
  "janitor",
  "knitr",
  "NMF",
  "pheatmap",
  "rmarkdown",
  "shiny",
  "Seurat",
  "tidyverse",
  "Tmisc",
  "VennDiagram",
  "viridis",
  "yaml"
)


# Bioconductor packages ---------------------------------------------------

# Software packages
bioc <- c(
  "annotate",
  "AnnotationDbi",
  "biomaRt",
  "DESeq2",
  "edgeR",
  "GEOquery",
  "GOstats",
  "limma",
  "minfi",
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
  "GO.db"
)


# Install & test ----------------------------------------------------------

# Do this once
# install.packages("BiocManager")

# Set your CRAN mirror
options("repos" = c(CRAN = "https://cloud.r-project.org/"))

allpkgs <- c(cran, bioc, anno)
allpkgs

# Install them all
library(BiocManager)
system.time(install(allpkgs))

# Check that it worked
for (p in cran) suppressPackageStartupMessages(library(p, character.only=TRUE))
for (p in bioc) suppressPackageStartupMessages(library(p, character.only=TRUE))
for (p in anno) suppressPackageStartupMessages(library(p, character.only=TRUE))


# GitHub ------------------------------------------------------------------

# devtools::install_github("stephenturner/Tmisc")
devtools::install_github("stephenturner/annotables")
