# requires pandoc and xelatex

PANDOC_OPTS = -s -S --latex-engine=xelatex --filter ./qids
PDF_SLIDES_OPTS = --slide-level 2 -t beamer --template vzg-slides.tex
HTML_SLIDES_OPTS = --slide-level 2 -t revealjs --section-divs --template revealjs.html

default: slides.html slides.pdf

deps: npm install

.SUFFIXES: .pdf .md .html

.md.pdf:
	pandoc $(PANDOC_OPTS) $(PDF_SLIDES_OPTS) -o $@ $<

.md.html:
	pandoc $(PANDOC_OPTS) $(HTML_SLIDES_OPTS) -o $@ $<

