%% Filename    : cekarticle.cls
%% Description : Caltech ERATO Kitano article style
%% Author(s)   : Michael Hucka <mhucka@@cds.caltech.edu>
%% Organization: CDS, California Institute of Technology
%% Created     : 2000-09-27 16:57 PDT
%% Revision    : $Id$
%% $Source$
%%
%% Copyright 2001 California Institute of Technology and
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

\def\filedate{2002/08/22}
\def\fileversion{"$Revision$"}

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{cekarticle}[\filedate\space Caltech ERATO Kitano article class]

%% ----------------------------------------------------------------------------
%% Package references and options.
%% ----------------------------------------------------------------------------

%% Keep in mind that hyperref needs to be the last package loaded.

\newif\if@notoc
\DeclareOption{toc}{\global\let\if@notoc\iffalse}
\DeclareOption{notoc}{\global\let\if@notoc\iftrue}

\newif\if@twocolumntoc
\DeclareOption{twocolumntoc}{\global\let\if@twocolumntoc\iftrue}
\DeclareOption{singlecolumntoc}{\global\let\if@twocolumntoc\iffalse}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{toc}
\ExecuteOptions{singlecolumntoc}
\ProcessOptions
\LoadClass{article}

\RequirePackage{alltt}
\RequirePackage{verbatim}
\RequirePackage{booktabs}
\RequirePackage{multicol}
\RequirePackage{array}
\RequirePackage[round]{natbib}
\RequirePackage{html}

% Switch on whether pdflatex is being used or not, so that we can
% set the proper switches.
\@ifundefined{pdfoutput}{%
  \RequirePackage{graphicx}
  % Test whether we're being run from latex or latex2html
  \latexhtml{
    % For latex.
    \RequirePackage[breaklinks]{hyperref}
  }{
    % For latex2html.
    \RequirePackage[latex2html,breaklinks]{hyperref}
  }
}{%
  \RequirePackage[pdftex]{graphicx}
  % 2001-05-25 <mhucka@caltech.edu> Note about hyperref: I have spent hours
  % trying to make colorlinks=true work, but failed.  The problem is that there
  % is some interaction between the latex2e color package and dvips, such that
  % if color is used, regular text on the page seems to be printed not as black
  % but as a combination of all RGB colors at 100% density.  The result is 
  % not-quite-black text that is fuzzy and ugly.  I'm giving up and resorting
  % to the default hyperref boxed link style instead of using colored links.
  % I find boxed links more intrusive in the text, but I can't spend any more
  % time debugging this problem.  
  \RequirePackage[pdftex,breaklinks=true,
  bookmarks=true,bookmarksopen=true,bookmarksopenlevel=2,
  pdfhighlight=/O,urlbordercolor={0.8 0.8 1},citebordercolor={0.8 0.8 1},
  linkbordercolor={0.8 0.8 1},pagebordercolor={0.8 0.8 1}]{hyperref}
}

%% ----------------------------------------------------------------------------
%% Main code.
%% ----------------------------------------------------------------------------

\raggedbottom

% Adjustments to package 'booktabs'.

\setlength{\cmidrulewidth}{0.3 pt}
\setlength{\lightrulewidth}{0.3 pt}
\setlength{\heavyrulewidth}{0.9 pt}

% Fix placement of figures & tables.  This keeps latex from shoving big
% floats to the end of a document when they are somewhat big, which it will
% do even if you put [htb] as the argument.

\setcounter{topnumber}{2}
\renewcommand\topfraction{1.0}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{1.0}
\renewcommand\textfraction{0.0}
\renewcommand\floatpagefraction{0.9}

% Margin adjustments. I've tried using vmargin.sty, but it interacts badly
% with page numbers at the bottom of the page, so I've resorted to hardcoding
% the dimensions like this.

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

% Set the table of contents depth

\setcounter{tocdepth}{2}

% Title style.  This is severely hacked from the orginal article.cls code.

\def\address#1{\gdef\@address{#1}}
\def\@address{\@latex@warning@no@line{No \noexpand\address given}}

\def\authoremail#1{\gdef\@authoremail{#1}}
\def\@authoremail{}

\def\acknowledge#1{\gdef\@acknowledge{#1}}
\def\@acknowledge{}

\def\@puttitle{%
  \rule{\textwidth}{0.01in}\\[\medskipamount]
  {\sffamily\bfseries\LARGE \@title \par}%
  \vskip -2pt%
  \rule{\textwidth}{0.01in}}

\def\@putauthorandaddress{%
  \large
  \renewcommand{\arraystretch}{0.95}%
  \begin{tabular}[t]{c}%
    \@author
  \end{tabular}%
  \\[1 pt]
  \normalsize
  \begin{tabular}[t]{c}%
    {\ttfamily \@authoremail}\\
    \@address
  \end{tabular}%
  \vskip 1 ex%
  \@acknowledge%
  \par}

\def\@puttoc{%
  \if@notoc
  \else
    \begingroup
      \small%
      % Tighten spacing between lines within an entry.
      % This assumes 10 pt font!
      \setlength{\baselineskip}{9.5pt}%
      % Now adjust inter-entry spacing.
      \addtolength{\parskip}{-1.3 ex}%
      \if@twocolumntoc
        \setlength{\columnsep}{16pt}%
        \begin{multicols}{2}
      \fi
      \tableofcontents%
      \if@twocolumntoc
        \end{multicols}
      \fi
      \normalsize%
      \addtolength{\parskip}{1.45 ex}%
    \endgroup
  \fi}

\def\ps@myheadings{%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@evenhead{\thepage\hfil\slshape\leftmark}%
  \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
  \let\@mkboth\@gobbletwo
  \let\sectionmark\@gobble
  \let\subsectionmark\@gobble
  }

\renewcommand\maketitle{\par
  \begingroup
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
  \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
  \long\def\@makefntext##1{\parindent 1em\noindent
    \hb@xt@1.8em{%
      \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
  \if@twocolumn
    \ifnum \col@number=\@ne
      \@maketitle
    \else
      \twocolumn[\@maketitle]%
    \fi
  \else
    \global\@topnum\z@   % Prevents figures from going at top of page.
    \@maketitle
  \fi
  \thispagestyle{empty}\@thanks
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
  }

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
  }

\def\@maketitle{%
  \newpage
  \null
  \begin{center}%
    \let \footnote \thanks
    \@puttitle
    \vskip 2em%
    {\lineskip .5em%
      \@putauthorandaddress
      }%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par%
  \vskip 1.5em%
  \ifx\pdfoutput\undefined
  \else
    \hypersetup{pdftitle={\@title},pdfauthor={\@author}}
  \fi%
  }

% Definition of paragraph style.

\setlength{\parindent}{0 pt}            % Unindented paragraphs, separated ...
\setlength{\parskip}{1.3 ex}            % ... by roughly one blank line.
\setlength{\partopsep}{-1 ex}

% Definition of section heading style.

\renewcommand{\section}{\@startsection%
  {section}{1}{0pt}{-1.8ex \@plus -1ex \@minus -.2ex}%
  {0.8ex}{\normalfont\Large\bfseries\sffamily}}

\renewcommand{\subsection}{\@startsection%
  {subsection}{2}{0pt}{-2ex \@plus 1ex \@minus -.2ex}%
  {0.8ex}{\slshape\large\bfseries\sffamily}}

\renewcommand{\subsubsection}{\@startsection%
  {subsubsection}{3}{0pt}{-1.5ex \@plus 1ex \@minus -.2ex}%
  {0.5ex}{\slshape\normalsize\bfseries\sffamily}}

\renewcommand{\paragraph}{\@startsection%
  {paragraph}{4}{0pt}{-1.25ex \@plus 1ex \@minus -.2ex}%
  {0.5ex}{\slshape\normalsize\bfseries\sffamily}}

% The following is a modified version of the macro from article.cls.
% It adjusts the vertical spacing in TOC for section lines.

\renewcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{0.2ex \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries\sffamily
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}

\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\if@twocolumntoc\else
      \leftskip #2
     \fi
     \relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \if@twocolumntoc\else
       \parindent #2
     \fi
     \relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {\sffamily #4}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont\sffamily #5}%
     \par}%
  \fi}

% The following is modified from natbib.sty, version 1999/05/28 7.0.
% This ensures that the References section gets a TOC entry.

\renewcommand{\bibsection}{%
  \addcontentsline{toc}{section}{\protect\textbf{\textsf{\refname}}}%
  \section*{\refname}}

% The following was ripped out of caption.sty, version 1.4b.
% Copyright (C) 1994-95 Harald Axel Sommerfeldt
% The first few lines set up the parameters for the layout created
% by this style file.

\newcommand{\captionsize}{\small}
\newcommand{\captionfont}{\captionsize\sffamily\slshape}
\newcommand{\captionlabelfont}{\captionsize\bfseries\slshape}

\newlength{\captionmargin}
\newsavebox{\as@captionbox}
\newlength{\as@captionwidth}
\newcommand{\as@normalcaption}[2]{%
  #1 #2\par}
\let\as@caption\as@normalcaption
\newcommand{\as@centercaption}[2]{%
  \parbox[t]{\as@captionwidth}{{\centering#1 #2\par}}}
\let\as@shortcaption\as@centercaption
\newcommand{\as@makecaption}[2]{%
  \setlength{\leftskip}{\captionmargin}%
  \setlength{\rightskip}{\captionmargin}%
  \addtolength{\as@captionwidth}{-2\captionmargin}%
  \captionfont%
  \sbox{\as@captionbox}{{\captionlabelfont #1:} #2}%
  \ifdim \wd\as@captionbox >\as@captionwidth
    \as@caption{{\captionlabelfont #1:}}{#2}%
  \else%
    \as@shortcaption{{\captionlabelfont #1:}}{#2}%
  \fi}
\renewcommand{\@makecaption}[2]{%
  \vskip\abovecaptionskip%
  \setlength{\as@captionwidth}{\linewidth}%
  \as@makecaption{#1}{#2}%
  \vskip\belowcaptionskip}
\ifx\@makerotcaption\undefined
\else
  \typeout{\space\space\space\space\space\space\space\space\space
           `rotating' package detected}
  \renewcommand{\@makerotcaption}[2]{%
    \captionfont%
    \sbox{\as@captionbox}{{\captionlabelfont #1:} #2}%
    \ifdim \wd\as@captionbox > .8\vsize
      \rotatebox{90}{%
        \setlength{\as@captionwidth}{.8\textheight}%
        \begin{minipage}{\as@captionwidth}%
          \as@caption{{\captionlabelfont #1:}}{#2}%
        \end{minipage}}\par
    \else%
      \rotatebox{90}{\usebox{\as@captionbox}}%
    \fi
    \hspace{12pt}}
\fi
\ifx\floatc@plain\undefined
\else
  \typeout{\space\space\space\space\space\space\space\space\space
           `float' package detected}
  \renewcommand\floatc@plain[2]{%
    \setlength{\as@captionwidth}{\linewidth}%
    \as@makecaption{#1}{#2}}
  \ifx\as@ruled\undefined
  \else
    \renewcommand\floatc@ruled[2]{%
      \setlength{\as@captionwidth}{\linewidth}%
      \captionfont%
      \as@caption{{\captionlabelfont #1:}}{#2}}
  \fi
\fi

% Additional new commands.

\newcommand{\tightspacing}{\renewcommand{\baselinestretch}{0.85}}
\newcommand{\regularspacing}{\renewcommand{\baselinestretch}{1.0}}

\newcommand{\menu}[1]{\textsf{\textbf{#1}}}
\newcommand{\class}[1]{\texttt{#1}}
\newcommand{\attrib}[1]{\texttt{#1}}
\newcommand{\attribtype}[1]{\texttt{#1}}
\newcommand{\attribvalue}[1]{\texttt{#1}}

\newenvironment{example}{%
  \begin{quote}%
    \begin{small}%
      \tightspacing%
      \begin{alltt}}
    {\end{alltt}%
  \end{small}%
\end{quote}}

\newenvironment{exampleTight}{%
  \begin{quote}%
    \begin{small}%
      \tightspacing%
      \renewcommand{\baselinestretch}{0.7}%
      \begin{alltt}}
    {\end{alltt}%
  \end{small}%
\end{quote}}

%begin{latexonly}
\ifx\pdfoutput\undefined
%end{latexonly}
  \newcommand{\incfig}[2][]{\includegraphics[width=#1]{#2.eps}}
  \newcommand{\incfigboxed}[2][]{\def\fboxsep{0pt}\fbox{\includegraphics[width=#1]{#2.eps}}}
  \newcommand{\incimage}[2][]{\includegraphics[width=#1]{#2.eps}}
  \newcommand{\incimageboxed}[2][]{\def\fboxsep{0pt}\fbox{\includegraphics[width=#1]{#2.eps}}}
%begin{latexonly}
\else
  \newcommand{\incfig}[2][]{\includegraphics[width=#1]{#2.pdf}}
  \newcommand{\incfigboxed}[2][]{\def\fboxsep{0pt}\fbox{\includegraphics[width=#1]{#2.pdf}}}
  \newcommand{\incimage}[2][]{\pdfimage width #1 {#2.png}}
  \newcommand{\incimageboxed}[2][]{\def\fboxsep{0pt}\fbox{\pdfimage width #1 {#2.png}}}
\fi
%end{latexonly}

%% -----------------------------------------------------------------------------
%% End of file `cekarticle.cls'.
%% -----------------------------------------------------------------------------
