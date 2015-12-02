default: all

all: dissertation.pdf

subdirs:
	#+make -C introduction
	#+make -C methods

dissertation.pdf: *.tex subdirs
	#  -silent
	latexmk -xelatex dissertation.tex

# To make sure that the pdf has fonts in good shape
# and is reduced in size, use the rewrite rule.
# As the difference is not relevant on-screen,
# this rule should be used for printing.
# Create a make print rule, if you want to.
dissertation-rewritten.pdf: dissertation.pdf
	gs  -sFONTPATH=/usr/share/fonts:/usr/share/texmf-dist/fonts  -o dissertation-rewritten.pdf  -sDEVICE=pdfwrite  -dPDFSETTINGS=/prepress  dissertation.pdf

clean:
	latexmk -c dissertation

distclean: clean
	latexmk -C
