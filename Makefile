# By default, only the main file dissertation.pdf is build.
# For printing, the rewritten version (dissertation-rewritten.pdf) should
# be used, whereas a linearised version for optimsied viewing while
# downloading can be created as dissertation-web-opt.pdf.
# The latter versions are createt via the all rule.
# Further infos why you want to use these versions can be found
# in the comments of the corresponding rules.

# Additional Makefile flags
# This silences Gnu Make
MAKEFLAGS += --no-print-directory

default: dissertation.pdf

all: dissertation.pdf web print

# This will create some additional metadata and store them to file.
metadata:
	@c=`cat countercompile.dat`; let c+=1; echo "$$c" > countercompile.dat
	@git log -n 1 --pretty="Filename: $file, commit: %h, date: %ad" | awk '{print($$4)}' | sed 's/,//g' > commit.dat
	@pdfinfo ./dissertation.pdf |  grep --color=NEVER Pages | sed 's/[^0-9]*//' > counterpage.dat

# This will display the above created metadata
displaymetadata:
	@c=`cat countercompile.dat`; p=`cat counterpage.dat`; echo -e "\nPages: $${p}, build nr.: $${c} on `date`\n";

# If you have an html server with ssh access running somewhere, you can
# use this rule to upload the metadata after each build.
# in the www folder there is a template for a stats homepage.
upload:
	#@rsync -aPve ssh counterpage.dat countercompile.dat servername:/var/www/example.com/htdocs/thesis/

subdir:
	#make subdir

dissertation.pdf: *.tex subdir
	latexmk -xelatex -silent dissertation.tex
	@make metadata
	@make upload
	@make displaymetadata

# To make sure that the pdf has fonts in good shape
# and is reduced in size, use the rewrite rule.
# As the difference is not relevant on-screen,
# this rule should be used to create pdfs for printing.
print: dissertation.pdf
	gs  -sFONTPATH=/usr/share/fonts:/usr/share/texmf-dist/fonts  -o dissertation_print.pdf  -sDEVICE=pdfwrite  -dPDFSETTINGS=/prepress  dissertation.pdf

# Linearisation, e.g., optimisation for "fast web view"
# Needed, for example, when submitting to SUB eDiss (Göttingen)
# The linearisation ensures that a display of partially downloaded
# pdfs is possible.
web: dissertation.pdf
	qpdf --linearize dissertation.pdf dissertation_web.pdf

short: *tex
	xelatex dissertation.tex
	@make metadata
	@make upload
	@make displaymetadata

clean:
	latexmk -c dissertation

distclean: clean
	latexmk -C
