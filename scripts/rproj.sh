#!/bin/sh

# Writes a standard Rproj file to workingDirName.Rproj

PROJFILE="$(basename "$(pwd)").Rproj"

cat > $PROJFILE << EOF
Version: 1.0

RestoreWorkspace: Default
SaveWorkspace: Default
AlwaysSaveHistory: Default

EnableCodeIndexing: Yes
UseSpacesForTab: Yes
NumSpacesForTab: 2
Encoding: UTF-8

RnwWeave: Sweave
LaTeX: pdfLaTeX

AutoAppendNewline: Yes
StripTrailingWhitespace: Yes
EOF

echo "Created new project file: $PROJFILE"