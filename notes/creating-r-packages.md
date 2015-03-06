# Creating R Packages

## Useful resources

* [Leek group guide to creating R packages](https://github.com/jtleek/rpackages)
* [Hadley's R package basics](http://adv-r.had.co.nz/Package-basics.html)
* [Slides from Karl Broman's R package lecture](http://kbroman.github.io/Tools4RR/assets/lectures/08_rpack_withnotes.pdf)

## Create package

Run this code in the directory you want to create the package in.

```S
## Load the libraries
library("devtools")
library("roxygen2")
library("knitr")

## Create the package directory
create("packagename")
```

Next, `touch` a blank README.md, `git init`, then git `add`, `commit`, and `push` to a GH repo you created. I.e.:

```bash
cd packagename
touch README.md
git init
git add *
git commit -m 'initial commit'
git remote add origin git@github.com:yourusername/packagename.git
git push -u origin master
```

## Add content

### Add a `DESCRIPTION` file.

Notes:
* Make knitr a dependency if writing a vignette.
* The `LazyData: true` bit means you don't have to call `data()` to access built-in datasets.
* `Roxygen: list(wrap = TRUE)` wraps text in Rd files (see [Hadley's post about this](http://lists.r-forge.r-project.org/pipermail/roxygen-devel/2014-February/000457.html))

```
Package: Tmisc
Title: Tmisc: Turner miscellaneous
Version: 0.1.0
Author: Stephen Turner <vustephenAAAAAAA@gmail.com>
Maintainer: Stephen Turner <vustephenAAAAAAA@gmail.com>
Description: Some generic convenience functions.
Depends:
    R (>= 3.0.2)
Suggests:
    knitr
License: GPL-3
LazyData: true
VignetteBuilder: knitr
Roxygen: list(wrap = TRUE)
```

### Add R functions

Put R functions in the `R/` directory, each in a separate file with `.R` extension. Use roxygen2 for documentation.

```S
#' A one sentence description of what your function does
#' 
#' A more detailed description of what the function is and how
#' it works. It may be a paragraph that should not be separated
#' by any spaces. 
#'
#' @param inputParameter1 A description of the input parameter \code{inputParameter1}
#' @param inputParameter2 A description of the input parameter \code{inputParameter2}
#'
#' @return output A description of the object the function outputs 
#'
#' @keywords keywords
#'
#' @export
#' 
#' @examples
#' myfunction(exampleinput1, exampleinput2)

myfunction <- function(inputParameter1, inputParameter2){
    ## Awesome code!
    return(result)
}
```

### Add vignettes

Can use knitr to write a vignette. Put .Rmd files in `vignettes/` directory. Include the following at the top of your vignette to instruct R to use knitr to build the vignette. You also must load the package in the first R chunk.

    <!--
    %\VignetteEngine{knitr::knitr}
    %\VignetteIndexEntry{Intro to packagename}
    -->

    ```{r, include=FALSE}
    library(manhattan)
    ```
    
    # Intro to packagename

Note below that building the package with RStudio does not automatically build the package vignette. This must be done with `devtools::build_vignettes()` run from the package directory.

## Document, Build, Check, Install

### The hard way

First, create documentation. Run this at the command line in the parent directory where the package directory lives.

```bash
RScript -e 'library(devtools); document("packagename")'
```

Next, build:

```bash
R CMD build packagename
```

Check:

```bash
R CMD check packagename_0.1.0.tar.gz
```

Install via shell:

```bash
R CMD INSTALL packagename_0.1.0.tar.gz
```

Or install via devtools:

```S
library(devtools)
install_github("githubUsername/packagename")
```

### The easy way with RStudio

* CMD-SHIFT-B to build and reload package
* CMD-SHIFT-E to check package
* Note that vignettes are not automatically built with RStudio. This must be done with `devtools::build_vignettes()` run from the package directory.
