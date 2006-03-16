%% Filename    : cekfaq.cls
%% Description : SBML FAQ style
%% Author(s)   : Michael Hucka <mhucka@@caltech.edu>
%% Organization: CDS, California Institute of Technology
%% Created     : 2003-06-09 00:40 PDT
%% Revision    : $Id$
%% $Source$

%% This file started out as 'cekfaq.cls' and was kept in the SBW
%% project CVS directory, until a separate CVS repository for the SBML
%% project was established at SourceForge.net in mid-2003.

%% Copyright 2003 California Institute of Technology and
%% Japan Science and Technology Corporation.
%% 
%% This file is free software; you can redistribute it and/or modify it
%% under the terms of the GNU Lesser General Public License as published
%% by the Free Software Foundation; either version 2.1 of the License, or
%% any later version.
%% 
%% This library is distributed in the hope that it will be useful, but
%% WITHOUT ANY WARRANTY, WITHOUT EVEN THE IMPLIED WARRANTY OF
%% MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  The software and
%% documentation provided hereunder is on an "as is" basis, and the
%% California Institute of Technology and Japan Science and Technology
%% Corporation have no obligations to provide maintenance, support,
%% updates, enhancements or modifications.  In no event shall the
%% California Institute of Technology or the Japan Science and Technology
%% Corporation be liable to any party for direct, indirect, special,
%% incidental or consequential damages, including lost profits, arising
%% out of the use of this software and its documentation, even if the
%% California Institute of Technology and/or Japan Science and Technology
%% Corporation have been advised of the possibility of such damage.  See
%% the GNU Lesser General Public License for more details.
%% 
%% You should have received a copy of the GNU Lesser General Public License
%% along with this library; if not, write to the Free Software Foundation,
%% Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.

%% ----------------------------------------------------------------------------
%% Identification.
%% ----------------------------------------------------------------------------

%% It would be so nice to be able to put the CVS/RCS 'Date' tag in the
%% \filedate below.  Unfortunately, LaTeX will barf on the resulting string.

\def\filedate{2003/08/06}
\def\fileversion{"$Revision$"}

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{sbmlfaq}[\filedate\space SB* FAQ Style]

%% ----------------------------------------------------------------------------
%% Definition of package options for this class.
%% ----------------------------------------------------------------------------

\newif\if@notoc
\newif\if@xdvi
\DeclareOption{toc}{\global\let\if@notoc\iffalse}
\DeclareOption{notoc}{\global\let\if@notoc\iftrue}
\DeclareOption{xdvi}{\global\let\if@xdvi\iffalse}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{twoside}
\ProcessOptions
\LoadClass{article}

%% ----------------------------------------------------------------------------
%% Main code.
%% ----------------------------------------------------------------------------

% Most things are abstracted out into a common file between cekmanual
% and cekarticle2.  The differences have to do with look and feel.

\RequirePackage{sbmlcommon}

% Margin adjustments. This is the same as cekarticle.cls.

\setlength{\marginparwidth}{0 pt}
\setlength{\oddsidemargin}{0 pt}
\setlength{\evensidemargin}{0 pt}
\setlength{\marginparsep}{0 pt}
\ifx\pdfoutput\undefined
  \setlength{\topmargin}{1 ex}
\else
  \setlength{\topmargin}{-8 ex}
\fi
\setlength{\voffset}{0 in}
\setlength{\hoffset}{0 in}
\setlength{\textwidth}{6.5 in}
\setlength{\textheight}{9 in}

% Graphics adjustments.  The path setup is so that the \includegraphics
% in the @puttile definition can find the logo file no matter where the
% document is located (but obviously, it only works for certain path
% combinations -- it's a total hack).

\graphicspath{{./logos/}{../tex/logos/}{../../tex/logos/}{../../../tex/logos/}}

% Title style.  The logo is inserted at the top.
% Note about the logo: for PDF I'm using a TIFF file instead of a PDF
% file, because the PDF version looks ugly (rough and jagged) on the 
% screen no matter what I do.  (It prints file, just looks ugly.)  Since
% we're in a modern age now and a lot of people look at PDF files on their
% screens instead of printing them out, I'm doing this to make it look
% reasonable on the screen.  The logo TIFF file is high enough resolution
% that it prints acceptably as well.

\def\@puttitle{%
  \vspace*{-6ex}%
  \@ifundefined{pdfoutput}{%
    \includegraphics[width=2.5in]{sbml-logo}\\%
  }{%
    \includegraphics[width=2.5in]{sbml-logo.jpg}\\%
  }
  %% The use of the tabular here is incorrect latex, but I couldn't figure
  %% out how to get the value of the width of the text (rather than the
  %% width of the line).  The stuff with all the line spacing etc. is all
  %% ugly and should be improved.
  \begin{center}
    \vspace*{20pt}
    \setlength{\extrarowheight}{6pt}
    \begin{tabular}{l}
      \toprule\\[-9pt]
      \sffamily\bfseries\Huge\@title\\[7pt]
      \midrule
    \end{tabular}
  \end{center}}
  
\def\@putauthorandaddress{%
  \large
  \renewcommand{\arraystretch}{0.95}%
  \begin{tabular}[t]{c}%
    \@author
  \end{tabular}%
  \\[0.2 ex]
  \normalsize
  \begin{tabular}[t]{c}%
    {\ttfamily \@authoremail}\\[0.1ex]
    \@address
  \end{tabular}%
  \vskip 1 ex%
  \@acknowledge%
  \par}

% Table of contents changes.

\renewcommand{\contentsname}{FAQ Contents} % Standard LaTeX variable.

% Definition of section heading style.

\renewcommand{\section}{\@startsection%
  {section}{1}{0pt}{-1.8ex \@plus 0.5ex \@minus -.2ex}%
  {1.75ex}{\rule{\textwidth}{0.75pt}\nopagebreak\\[-1pt]\hspace*{-20.2pt}\normalfont\large\bfseries\sffamily}}

\renewcommand{\subsection}{\@startsection%
  {subsection}{2}{0pt}{-1.75ex \@plus 1ex \@minus -.2ex}%
  {0.6ex}{\normalsize\bfseries\sffamily}}

\renewcommand{\subsubsection}{\@startsection%
  {subsubsection}{3}{0pt}{-1.25ex \@plus 1ex \@minus -.2ex}%
  {0.35ex}{\normalsize\bfseries\sffamily}}

\renewcommand{\paragraph}{\@startsection%
  {paragraph}{4}{0pt}{-1ex \@plus 1ex \@minus -.2ex}%
  {0.35ex}{\normalsize\bfseries\sffamily}}

\newcommand\maketitlepage{\par
  \begingroup
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
  \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
  \long\def\@makefntext##1{\parindent 1em\noindent
    \hb@xt@1.8em{%
      \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
  \vskip 2em%
  \if@twocolumn
    \ifnum \col@number=\@ne
      \@maketitle
    \else
      \twocolumn[\@maketitle]%
    \fi
  \else
    \newpage
    \global\@topnum\z@   % Prevents figures from going at top of page.
    \@maketitle
  \fi
  \thispagestyle{empty}\@thanks
  \vfill
  \@puttoc
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@authoremail\@empty
  \global\let\@address\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \newpage
  }


%% -----------------------------------------------------------------------------
%% End of file `sbmlfaq.cls'.
%% -----------------------------------------------------------------------------
