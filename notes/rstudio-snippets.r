snippet lib
  library(${1:package})

snippet mat
  matrix(${1:data}, nrow = ${2:rows}, ncol = ${3:cols})

snippet if
  if (${1:condition}) {
    ${0}
  }

snippet el
  else {
    ${0}
  }

snippet ei
  else if (${1:condition}) {
    ${0}
  }

snippet fun
  ${1:name} <- function(${2:variables}) {
    ${0}
  }

snippet for
  for (${1:variable} in ${2:vector}) {
    ${0}
  }

snippet while
  while (${1:condition}) {
    ${0}
  }

snippet switch
  switch (${1:object},
    ${2:case} = ${3:action}
  )

snippet apply
  apply(${1:array}, ${2:margin}, ${3:...})

snippet lapply
  lapply(${1:list}, ${2:function})

snippet sapply
  sapply(${1:list}, ${2:function})

snippet mapply
  mapply(${1:function}, ${2:...})

snippet tapply
  tapply(${1:vector}, ${2:index}, ${3:function})

snippet vapply
  vapply(${1:list}, ${2:function}, FUN.VALUE = ${3:type}, ${4:...})

snippet rapply
  rapply(${1:list}, ${2:function})

snippet ts
  `r paste("#", date(), "------------------------------\n")`

snippet shinytemplate
  library(shiny)
  ui <- fluidPage("Hello World")
  server <- function(input, output) {}
  shinyApp(ui = ui, server = server)
  
snippet hadleyverse
  library(dplyr)
  library(readr)
  library(tidyr)
  library(stringr)
  library(ggplot2)
  theme_set(theme_bw(base_size=16) + theme(strip.background = element_blank()))
  
snippet initrmd
  library(knitr)
  opts_chunk\$set(message=FALSE, warning=FALSE, eval=TRUE, echo=TRUE)
  

snippet lu
  length(unique($0))

snippet bib
  bibliography: ~/bibtex/library.bib