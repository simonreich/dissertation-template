% This is a conglomerate of various tex files Jan-Matthias Braun merged
% for his thesis with excerpts from Jeremie Papon's Thesis (https://github.com/jpapon/papon_thesis)
% which itself was forked of the original Harvard Latex template by Jordan Suchow (suchow@fas.harvard.edu).
%
% In case of questions, please contact Jan-Matthias Braun (jan_braun@gmx.net).
% Otherwise feel free to use this template for your own thesis.
%
% Notes
% (1) Please consult the comments on Layout-Tuning below.
% (2) This is the future, and it uses UTF-8, you can directly include
%     characters like ℝ, with the right definitions (see UTF-8 below).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Authors
%
% Original Harvard Template by Jordan Suchow (suchow@fas.harvard.edu)
%
% Fork by Jeremie Papon https://github.com/jpapon/papon_thesis
% (c) 2014
%
% Fork by Jan-Matthias Braun jan_braun@gmx.net
% (c) 2015
%
% Fork by Simon Reich https://github.com/simonreich
% (c) 2017


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{phd-goe}[2018/04/02 Ph.D. Dissertation template]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Parse Parameters

\RequirePackage{ifthen}

% Variable to control output of title page, additional lists, appendices, etc.
\newboolean{fulldocument}
\setboolean{fulldocument}{false}
\DeclareOption{fulldocument}{%
  \setboolean{fulldocument}{true}
}

% Variable to control output of notes, remarks, and todos.
\newboolean{internaldraft}
\setboolean{internaldraft}{false}
\DeclareOption{internaldraft}{%
  \setboolean{internaldraft}{true}
}

% Removes all colors from hyperlinks
\newboolean{printversion}
\setboolean{printversion}{false}
\DeclareOption{printversion}{%
  \setboolean{printversion}{true}
}

% Show compile number on internaldraft
\newboolean{showcompilenumber}
\setboolean{showcompilenumber}{false}
\DeclareOption{showcompilenumber}{%
  \setboolean{showcompilenumber}{true}
}

% Show compile number on internaldraft
\newboolean{showcommitnumber}
\setboolean{showcommitnumber}{false}
\DeclareOption{showcommitnumber}{%
  \setboolean{showcommitnumber}{true}
}

%% Fallback
\DeclareOption*{
  \ClassWarning{myclass}{Unknown option '\CurrentOption'}
}

%% Process given options
\ProcessOptions\relax


% some definitions
\def\title#1{\gdef\title{#1}}
\def\stitle#1{\gdef\stitle{#1}}
\def\author#1{\gdef\author{#1}}
\def\hometown#1{\gdef\hometown{#1}}
\def\homeland#1{\gdef\homeland{#1}}
\def\degreeyear#1{\gdef\degreeyear{#1}}
\def\degreemonth#1{\gdef\degreemonth{#1}}
\def\phdprogram#1{\gdef\phdprogram{#1}}
\def\university#1{\gdef\university{#1}}
\def\universitycity#1{\gdef\universitycity{#1}}
\def\universitystate#1{\gdef\universitystate{#1}}

% KOMA uses type area. General guidelines on good readability aim for:
%      10 to 12 Words/Line, ca 60-70 Characters / Line
% This should be the default of KOMA's typearea with DIV=calc.
% BCOR is the binding correction. Update BCOR for final binding!
%
% Further readings:
% documentation -> lb2-ch4.pdf
% http://www.webmasterpro.de/design/article/typografie-12-wichtige-grundlagen-fuer-den-richtigen-einsatz-von-schriften.html
%% Load base
\LoadClass[
    xetex,
    a4paper,
    fleqn,                      %% flush left equations
    12pt,
    % twoside,openright,        %% two sided (book), open chapters on the right hand side
    % twocolumn,
    BCOR10mm, DIV=calc,         %% 10mm for binding, keep around 12 words/line
    % DIV=classic,
    % titlepage,
    % draft
    titlepage=firstiscover,
    parskip=half,
    english
]{scrbook}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Language Selection
% Language selection for XeLaTeX (replaces babel)
\RequirePackage{polyglossia}
\setdefaultlanguage{english}

% This is only for biblatex
\RequirePackage{csquotes}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   PDF-Metadata
\RequirePackage[bookmarks, 
                colorlinks=true, 
                citecolor=red1,
                filecolor=black,
                linkcolor=blue1,
                urlcolor=red1,
                pdfdisplaydoctitle=true,
                ]{hyperref} 
\hypersetup{
  pdftoolbar=true,            %% show Acrobat’s toolbar?
  pdfmenubar=true,            %% show Acrobat’s menu?
  pdffitwindow=false,         %% window fit to page when opened
  pdfstartview={Fit},         %% fits the page to the window
  pdfnewwindow=true,          %% links in new window
  %hidelinks,                  %% for printing: turn link colours off. This is done below via the printversion flag
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Font selection

% See https://wiki.ubuntuusers.de/XeTeX/
\RequirePackage{xltxtra}
\RequirePackage{microtype}                  %% defaults are protrusion=true,expansion=true


% See http://www.macfreek.nl/memory/Fonts_in_LaTeX
% I have the impression, that Palatino is better to read on paper ... 
% On screen I prefer something else.
\setmainfont[Mapping=tex-text, Numbers=OldStyle]{TeX Gyre Pagella}      % Palatino as main font
%\setmainfont[Numbers=OldStyle]{TeX Gyre Termes}        % Times New Roman
\setsansfont[Mapping=tex-text, Numbers=OldStyle]{Lato}
\setmonofont[Mapping=tex-text]{Source Code Pro}

% Large chapter numbers
\RequirePackage{fix-cm}
\RequirePackage{titlesec}
\newcommand{\hsp}{\hspace{0pt}}
\titleformat{\chapter}[hang]{\flushright\fontseries{b}\fontsize{80}{100}\selectfont}{\fontseries{b}\fontsize{100}{130}\selectfont\textcolor{gray75}{\thechapter}\hsp}{0pt}{\break\Huge\bfseries}[]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Layout-Tuning

\RequirePackage[bottom]{footmisc}
% For final paragraph spacing/ragged bottom tuning:
%\raggedbottom
%\enlargethispage{\baselineskip}
% + manual linebreaks
% See: http://www.latex-community.org/forum/viewtopic.php?f=47&t=10862


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   TIKZ
\RequirePackage{tikz}
\RequirePackage{gnuplot-lua-tikz}
\usetikzlibrary{shapes,arrows,fit,decorations.pathreplacing}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Abbreviations
% Handle abbreviations properly
% This is useful for inline enumerations, e.g., an explicit 1. ...
\RequirePackage{xpunctuate}                 %% Define shortcuts for often used abbreviations
\newcommand{\ie}{\xperiodafter{i.e}}
\newcommand{\Ie}{\xperiodafter{I.e}}
\newcommand{\eg}{\xperiodafter{e.g}}
\newcommand{\Eg}{\xperiodafter{E.g}}
\newcommand{\etc}{\xperiodafter{etc}}
\newcommand{\Etc}{\xperiodafter{Etc}}
\newcommand{\ff}{\xperiodafter{ff}}

% Figure References
\newcommand{\FigurenameC}{Fig.}
\newcommand{\FigurenameS}{Fig.}
\newcommand{\Figref}[1]{\FigurenameC~\ref{#1}}
\newcommand{\figref}[1]{\FigurenameS~\ref{#1}}
\newcommand{\Tabref}[1]{Tab.~\ref{#1}}
\newcommand{\tabref}[1]{Tab.~\ref{#1}}
\newcommand{\Eqnref}[1]{Eqn.~(\ref{#1})}
\newcommand{\eqnref}[1]{Eqn.~(\ref{#1})}
\newcommand{\Secref}[1]{Sec.~\ref{#1}}
\newcommand{\secref}[1]{Sec.~\ref{#1}}
\newcommand{\Charef}[1]{Chapter~\ref{#1}}
\newcommand{\charef}[1]{Chapter~\ref{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Colors
\RequirePackage{color}
\definecolor{MidnightBlue}{RGB}{0,0,160} 
\definecolor{blue1}{RGB}{0,0,160} 
\definecolor{green1}{RGB}{0,160,0} 
\definecolor{red1}{RGB}{160,0,0} 
\definecolor{orange1}{RGB}{229,92,0} 
\definecolor{blue120}{RGB}{204,204,236} 
\definecolor{green120}{RGB}{204,236,204} 
\definecolor{red120}{RGB}{236,204,204} 

\definecolor{Crimson}{rgb}{0.6471, 0.1098, 0.1882}
\definecolor{DarkBlue}{rgb}{0.1216, 0.1843, 0.2902}
\definecolor{Silver}{rgb}{0.5490, 0.5451, 0.5882}
\definecolor{darkblue}{rgb}{0.1216, 0.1843, 0.44}

\definecolor{gray75}{gray}{0.75}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Draft stage helpers

% For a really nice todo package including colours & listings, see
% https://tex.stackexchange.com/questions/9796/how-to-add-todo-notes
\RequirePackage[colorinlistoftodos,prependcaption,textsize=tiny]{todonotes}

\RequirePackage{comment}                 % Allows make comments out of environments
\RequirePackage{etoolbox}                % Easy test for empty arguments

% Suppress output if not in fulldocument mode
\newcommand{\onlyinfulldocument}[1]{%
  \ifthenelse{\boolean{fulldocument}}{%
    #1
  }{}%
}%

% Suppress output if not in internaldraft mode
\newcommand{\onlyindraft}[1]{%
  \ifthenelse{\boolean{internaldraft}}{%
    #1
  }{}%
}%

\ifthenelse{\boolean{internaldraft}} {%
  \newenvironment{outline}{%
    \textcolor{MidnightBlue}\bgroup
    \textbf{Section Outline:}\\
  }{ \egroup}%

  \newenvironment{itemoutline}{%
    \textcolor{MidnightBlue}\bgroup
    \textbf{Section Outline:}\\
    \begin{itemize}
  } {%
    \end{itemize} \egroup
  }%

} {%
  \excludecomment{outline}
  \excludecomment{itemoutline}
}%

% Hide link color, if in print
\ifthenelse{\boolean{printversion}} {%
  \hypersetup{
    hidelinks,                  %% for printing: turn link colors off
  }
} {}%


%% Remark note
\newcommand{\REMARK}[1]{\onlyindraft{\todo[linecolor=green,backgroundcolor=green!25,bordercolor=green]{#1}}}

%% Marker where I left writing
\newcommand{\TODO}[1][]{
  \onlyindraft{%
    \textcolor{red}{\ldots}%
    \todo[linecolor=red,backgroundcolor=red!25,bordercolor=red]{%
      TODO: \ifstrempty{#1}{to be continued}{#1}%
    }%
  }%
}%

%% Marker for additional citations
\newcommand{\NEEDSCITATION}[1][]{
  \onlyindraft{%
    \todo[linecolor=blue,backgroundcolor=blue!25,bordercolor=blue]{%
      Citation needed\ifstrempty{#1}{}{: #1}%
    }%
  }%
}%

%% Marker for additional citations for float environments
\newcommand{\NEEDSCITATIONf}[1][]{
  \onlyindraft{%
    \todo[linecolor=blue,backgroundcolor=blue!25,bordercolor=blue,inline]{%
      Citation needed\ifstrempty{#1}{}{: #1}%
    }%
  }%
}%


% %%% Draft revision mark at end of every page %%%%%%%%%%%%
%
% The AddEverypageHook is used to register the printrev command.
% An optional parameter allows arbitrary revision tags.
% \printrev is conditioned on the bool internaldraft.
% When internaldraft is false, the marker is not printed.
\RequirePackage{everypage}
\RequirePackage[absolute]{textpos}
\RequirePackage{datetime}
\newcommand\printrev[1]{%
  \onlyindraft{%
    \begin{textblock*}{\paperwidth}(0mm,\paperheight-16mm)%
      \begin{center}%
        \textit{\footnotesize --- Document rendered on \today{} \currenttime{} #1 ---%
          \ifthenelse{\boolean{showcompilenumber}} {Build \#\input{countercompile.dat} ---} {}%
          \ifthenelse{\boolean{showcommitnumber}} {Commit: \#\input{commit.dat} ---} {}%
        }%
      \end{center}%
    \end{textblock*}%
  }
}
\AddEverypageHook{\printrev{}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Title page


% Trying to unstrip the KOMA title page.
% Although this does not seem to work in any way.
\newcommand*{\mytitlemargin}{\dimexpr 0mm\relax}
\renewcommand{\coverpagetopmargin}{\mytitlemargin}
\renewcommand{\coverpageleftmargin}{\mytitlemargin}
\renewcommand{\coverpagerightmargin}{\mytitlemargin}
\renewcommand{\coverpagebottommargin}{2\mytitlemargin}

\RequirePackage{geometry}

\renewcommand{\maketitle}{%
  \newgeometry{top=3cm, bottom=3cm, left=5cm}
  \begin{titlepage}
  %\singlespacing
  \thispagestyle{empty}
  \begin{flushright}
	\ifthenelse{\equal{\stitle}{}}{\Huge \textcolor{DarkBlue}{\textit{\title}}}{\Huge \textcolor{DarkBlue}{\textit{\title:\\\stitle}}}
  \textcolor{Silver}{\rule{\textwidth}{2.0pt}}\\\vspace{24pt}%
  \normalsize \scshape Dissertation \\\vspace{12pt}%
  in order to obtain the doctoral degree\\%
  ``Doctor rerum naturalium''\\%
  of the \university\\\vspace{12pt}%
  in the Doctoral program\\%
  \phdprogram\ of\\%
  the Georg-August University School of Science (GAUSS)\\\vspace*{\fill}%
  submitted by\\%
  \author\\\vspace{12pt} %
  of \hometown, \homeland\\%
  (place of birth)\\\vspace*{\fill}%
  \includegraphics[width=30mm]{figures/UniLogo1}\\\vspace{12pt}%
  \university\\ \universitycity, \universitystate\\%
  \degreemonth\ \degreeyear \\%
  \end{flushright}
  \end{titlepage}
  \restoregeometry
}

\newcommand{\abstractpage}{
  \newpage
  \pagenumbering{roman}
  \setcounter{page}{3}
%  \thispagestyle{empty}
%  \pagestyle{fancy}
%  \renewcommand{\headrulewidth}{0.0pt}
  \vspace*{-28mm}
  \begin{center}
  \vspace*{1pt} % \huge
	\ifthenelse{\equal{\stitle}{}}{\LARGE \textcolor{DarkBlue}{\textit{\title}}}{\LARGE \textcolor{DarkBlue}{\textit{\title: \stitle}}}\\
  %\vspace*{15pt}
  \vspace*{9pt}
  \Large \scshape Abstract \\ \normalfont \rmfamily
  \end{center}
  \input{frontmatter/abstract.tex}
  \newpage
  %\cfoot{\thepage}
}

\newcommand{\acknowledgementpage}{
	\onehalfspace
  \chapter*{Acknowledgments}
	\markboth{Acknowledgments}{}
  \input{./frontmatter/acknowledgments.tex}
}

\newcommand{\publicationspage}{
	\onehalfspace
  \chapter*{List of related publications}
	\markboth{List of related publications}{}
  \input{./frontmatter/publications.tex}
  \newrefsection
}

\newcommand{\contributionspage}{
	\onehalfspace
  \chapter*{Contributions}
	\markboth{Contributions}{}
  \input{./frontmatter/contributions.tex}
  \newrefsection
}





\RequirePackage{calc}                       %% ermoeglicht Rechnen mit Laengen und Zaehlern
\RequirePackage{quotchap}                   %% Quotation at chapters
\RequirePackage{setspace}                   %% line-spacing
\endinput
