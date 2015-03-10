# Generates a PDF article from all markdown documents in the current working directory

PDF := $(patsubst %.md,%.md.pdf,$(wildcard *.md))

all : $(PDF)

%.md.pdf : %.md
	pandoc -s -V geometry:margin=1in -V documentclass:article -V fontsize=12pt $< -o $@
	
clean : 
	rm $(PDF)
	
rebuild : clean all
