Copyright
============

Original Version by Jordan Suchow (suchow@fas.harvard.edu)
https://github.com/suchow/dissertate
Copyright for portions of this template are held by Jordan Suchow, 2014 as part of project dissertate.
The MIT License (MIT)

Forked by Jeremie Papon 2014 (jpapon@gmail.com)
https://github.com/jpapon/papon_thesis
Copyright for portions of this template are held by Jeremie Papon, 2014 as part of project papon_thesis.
Creative Commons Attribution-NonCommercial International License 4.0


Forked by Jan-Matthias Braun 2016 (jan_braun@gmx.net)
https://git.physik3.gwdg.de/jbraun2/dissertation-template
Copyright for portions of this template are held by Jan-Matthias Braun, 2016 as part of project dissertation-template.

Forked by Simon Reich, 2018 (sreich@gwdg.de)
https://github.com/simonreich/dissertation-template
All other copyright for this project are held by Simon Reich, 2018.
Creative Commons Attribution-NonCommercial International License 4.0

Notes
=====

1. This file is intended for use with xelatex.

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

Adapt dissertation.tex and frontmatter/*.tex to your name and title. If 
everything is set to your liking, set fulldocument to false, to remove all 
the title page cruft from your document for writing.


Document Generation
===================

A makefile is included to automate the generation of the final pdf.
The default rule will compile the LaTeX sources, so that you can inspect
the results. For several reasons, this version should not be used for print
or web download.

Therefore, the makefile can generate other versions, better suited for their
specialised use case. The all rule will generate them.

Print Version
=============

Depending on the mixture of used fonts in embedded pdfs, characters can be
missing in the final print. This error was never observed in onscreen
viewers. Use the rule for dissertation-rewritten.pdf to get a version with
consistent fonts. In my case, this led to a reduction in pdf size to one
third and all characters visible on paper.

Please note that there is also the printversion option for the phd-goe class.

Web Version
===========

For online view, a "linearised" pdf allows to view the contents while the
pdf is still downloading. When publishing your thesis in the web, this
version is to be preferred and the Göttingen SUB will demand such a version.
Use the dissertation-web-opt.pdf rule to create a version optimised for
"fast web view".
This version is created based on dissertation-rewritten.pdf, therefore it
should provide nice output on paper.

