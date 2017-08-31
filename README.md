Introduction
============

This is a wild mix of several own documents, additional fragments of the internet, and all intermignled with excerpts from Jeremie Papon's thesis.
This is a fork of the original Harvard Latex template by Jordan Suchow (suchow@fas.harvard.edu). 
In case of questions, please contact Jan-Matthias Braun (jan_braun@gmx.net).
Otherwise feel free to use this template for your own thesis.

### Notes ###
1. This file is intended for use with xelatex, but the corresponding
   lines for pdflatex are included as comments.

2. Please consult the comments on Layout-Tuning below.

3. This is the future, and it uses UTF-8, you can directly include
   characters like ℝ, with the right definitions (see UTF-8 below).

4. Generally read the comments on how things could be done.

5. This collection of files is most easily compiled with the
   included Makefile, which uses latexmk.
   This handles everything (including gloassaries) automagically.

6. The chapter lines in the lists are not robust, you really have
   to manually check.
   Still, in case of many entries they do help a lot.


Getting Started
===============

Adapt the vorspann.tex to your name and title. If everything is set
to your liking, set fulldocument to false, to remove all the title
page cruft from your document for writing.


Document Generation
===================

A makefile is included to automate the generation of the final pdf.
The default rule will compile the LaTeX sources, so that you can inspect
the results. For several reasons, this version should not be used for print
or web download.

Therefore, the makefile can generate other versions, better suited for their
specialised use case. The all rule will generate them.

### Print Version ###

Depending on the mixture of used fonts in embedded pdfs, characters can be
missing in the final print. This error was never observed in onscreen
viewers. Use the rule for dissertation-rewritten.pdf to get a version with
consistent fonts. In my case, this led to a reduction in pdf size to one
third and all characters visible on paper.

### Web Version ###

For online view, a "linearised" pdf allows to view the contents while the
pdf is still downloading. When publishing your thesis in the web, this
version is to be preferred and the Göttingen SUB will demand such a version.
Use the dissertation-web-opt.pdf rule to create a version optimised for
"fast web view".
This version is created based on dissertation-rewritten.pdf, therefore it
should provide nice output on paper.

