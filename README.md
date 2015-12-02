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

### TODO ###
1. This template still uses the old subfigure package.
   Please feel inclined to use the subfig package and
   send me the patches. :-)

2. The title page has too many things hard coded.
   You might have to touch the code.

3. There are lots of other things to do, please fork
   and prepare your changes for public access or send
   them back to me.


Getting Started
===============

Adapt the vorspann.tex to your name and title. If everything is set
to your liking, set fulldocument to false, to remove all the title
page cruft from your document for writing.

