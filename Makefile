# By default, only the main file dissertation.pdf is build.
# For printing, the rewritten version (dissertation-rewritten.pdf) should
# be used, whereas a linearised version for optimsied viewing while
# downloading can be created as dissertation-web-opt.pdf.
# The latter versions are createt via the all rule.
# Further infos why you want to use these versions can be found
# in the comments of the corresponding rules.

default: dissertation.pdf

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
# this rule should be used to create pdfs for printing.
# Create a make print rule, if you want to.
dissertation-rewritten.pdf: dissertation.pdf
	gs  -sFONTPATH=/usr/share/fonts:/usr/share/texmf-dist/fonts  -o dissertation-rewritten.pdf  -sDEVICE=pdfwrite  -dPDFSETTINGS=/prepress  dissertation.pdf

# Linearisation, e.g., optimisation for "fast web view"
# Needed, for example, when submitting to SUB eDiss (Göttingen)
# The linearisation ensures that a display of partially downloaded
# pdfs is possible.
dissertation-web-opt.pdf: dissertation-rewritten.pdf
	qpdf --linearize dissertation-rewritten.pdf dissertation-web-opt.pdf

clean:
	latexmk -c dissertation

distclean: clean
	latexmk -C
