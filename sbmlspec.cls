%% Filename    : sbmlspec.cls
%% Description : SBML Team
%% Author(s)   : Michael Hucka <mhucka@caltech.edu>
%% Organization: Biological Network Modeling Center, Caltech
%% Created     : 2006-03-15
%% Revision    : $Id$
%% $Source$
%%
%% Copyright 2006 California Institute of Technology
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
%% California Institute of Technology has no obligations to provide
%% maintenance, support, updates, enhancements or modifications.  In no
%% event shall the California Institute of Technology be liable to any
%% party for direct, indirect, special, incidental or consequential
%% damages, including lost profits, arising out of the use of this software
%% and its documentation, even if the California Institute of Technology
%% has been advised of the possibility of such damage.  See the
%% GNU Lesser General Public License for more details.
%% 
%% You should have received a copy of the GNU Lesser General Public License
%% along with this library; if not, write to the Free Software Foundation,
%% Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.

%% ----------------------------------------------------------------------------
%% Identification.
%% ----------------------------------------------------------------------------

%% It would be so nice to be able to put the CVS/RCS 'Date' tag in the
%% \filedate below.  Unfortunately, LaTeX will barf on the resulting string.

\def\filedate{2006/03/15}

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{sbmlspec}[\filedate\space SBML Specification LaTeX Style]

%% ----------------------------------------------------------------------------
%% Package references and options.
%% ----------------------------------------------------------------------------

%% Keep in mind that hyperref needs to be almost the last package loaded.

\newif\if@notoc
\DeclareOption{toc}{\global\let\if@notoc\iffalse}
\DeclareOption{notoc}{\global\let\if@notoc\iftrue}

\newif\if@twocolumntoc
\DeclareOption{twocolumntoc}{\global\let\if@twocolumntoc\iftrue}
\DeclareOption{singlecolumntoc}{\global\let\if@twocolumntoc\iffalse}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{toc,twoside}
\ExecuteOptions{singlecolumntoc}
\ProcessOptions
\LoadClass{article}

%% ----------------------------------------------------------------------------
%% Dependencies on other packages.
%% ----------------------------------------------------------------------------

\RequirePackage{ifpdf}
\RequirePackage{alltt}
\RequirePackage{verbatim}
\RequirePackage{booktabs}
\RequirePackage{multicol}
\RequirePackage{array}
\RequirePackage[round]{natbib}
\RequirePackage{html}
\RequirePackage{xspace}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amscd}
\RequirePackage{array}
\RequirePackage{dchem}
\RequirePackage{wrapfig}
\RequirePackage{nameref}
\RequirePackage[pagewise,displaymath,mathlines,edtable]{lineno}
\RequirePackage[matrix,frame,arrow,poly]{xy}

% Load varioref but only if not generating HTML, because on HTML
% pages it doesn't make sense.

\latexhtml{
%begin{latexonly}
  \RequirePackage[american]{varioref}
%end{latexonly}
}{
  \newcommand{\vref}[1]{\ref{#1}}
}

% Load hyperref last
%
% Switch on whether pdflatex is being used or not, so that we can
% set the proper switches.
\ifpdf
  \RequirePackage[pdftex]{graphicx}
  \RequirePackage[pdftex,breaklinks=true,colorlinks=true,
  bookmarks=true,bookmarksopen=true,bookmarksopenlevel=2,
  pdfhighlight=/O,linkcolor={MediumBlue},citecolor={MediumBlue},
  pagecolor={MediumBlue},urlcolor={MediumBlue}]{hyperref}

  \RequirePackage[pdftex,rgb,dvipsnames,svgnames,hyperref]{xcolor}
\else
  \RequirePackage{graphicx}
  % Test whether we're being run from latex or latex2html
  \latexhtml{
    % For latex.
    \RequirePackage[breaklinks]{hyperref}
  }{
    % For latex2html.
    \RequirePackage[latex2html,breaklinks]{hyperref}
  }
  \RequirePackage[rgb,dvipsnames,svgnames,hyperref]{xcolor}
\fi

%% ----------------------------------------------------------------------------
%% Font selection.
%% ----------------------------------------------------------------------------

% This sets up Helvetica for headings and TX Typewriter for the tt font.

\RequirePackage{helvet}
\def\Hv@scale{0.87}  % Default Helvetica size is too big; make it smaller.

% The following sets up txtt for the typewriter font.

\renewcommand{\ttdefault}{txtt}
\DeclareMathAlphabet{\mathtt}{OT1}{txtt}{m}{n}
\SetMathAlphabet{\mathtt}{bold}{OT1}{txtt}{b}{n}

% The next bit is an adaption of code from ot1phv.fd and adapted to the txtt
% fonts.  The txtt fonts are just a tad too big, so this tries to rescale
% them down a tiny bit.  This isn't completely right because I couldn't
% figure out the right syntax when the DeclareFontShape uses ssub below.
% (Notice how the ones with ssub don't have the \Txtt@@scale factor.)

\def\Txtt@scale{0.975}
\edef\Txtt@@scale{s*[\csname Txtt@scale\endcsname]}%

\DeclareFontFamily{OT1}{txtt}{\hyphenchar \font\m@ne}
\DeclareFontShape{OT1}{txtt}{m}{n}{	%rebular
     <-> \Txtt@@scale txtt%
}{}
\DeclareFontShape{OT1}{txtt}{m}{sc}{	%cap & small cap
     <-> \Txtt@@scale txttsc%
}{}
\DeclareFontShape{OT1}{txtt}{m}{sl}{	%slanted
     <-> \Txtt@@scale txttsl%
}{}
\DeclareFontShape{OT1}{txtt}{m}{it}{	%italic
     <-> ssub * txtt/m/sl%
}{}
\DeclareFontShape{OT1}{txtt}{m}{ui}{	%unslanted italic
     <-> ssub * txtt/m/sl%
}{}
\DeclareFontShape{OT1}{txtt}{b}{n}{	%bold
     <-> \Txtt@@scale txbtt%
}{}
\DeclareFontShape{OT1}{txtt}{b}{sc}{	%bold cap & small cap
     <-> \Txtt@@scale txbttsc%
}{}
\DeclareFontShape{OT1}{txtt}{b}{sl}{	%bold slanted
     <-> \Txtt@@scale txbttsl%
}{}
\DeclareFontShape{OT1}{txtt}{b}{it}{	%bold italic
     <-> ssub * txtt/b/sl%
}{}
\DeclareFontShape{OT1}{txtt}{b}{ui}{	%bold unslanted italic
     <-> ssub * txtt/b/sl%
}{}
\DeclareFontShape{OT1}{txtt}{bx}{n}{	%bold extended
     <-> ssub * txtt/b/n%
}{}
\DeclareFontShape{OT1}{txtt}{bx}{sc}{	%bold extended cap & small cap
     <-> ssub * txtt/b/sc%
}{}
\DeclareFontShape{OT1}{txtt}{bx}{sl}{	%bold extended slanted
     <-> ssub * txtt/b/sl%
}{}
\DeclareFontShape{OT1}{txtt}{bx}{it}{	%bold extended italic
     <-> ssub * txtt/b/sl%
}{}
\DeclareFontShape{OT1}{txtt}{bx}{ui}{	%bold extended unslanted italic
     <-> ssub * txtt/b/sl%
}{}


%% ----------------------------------------------------------------------------
%% Main code.
%% ----------------------------------------------------------------------------

\raggedbottom

% Macros for making consistent font, color, and other selections.

\newcommand{\literalFont}[1]{\textup{\texttt{#1}}}
\newcommand{\figureFont}[1]{\textsf{#1}}
\newcommand{\changedColor}{BrickRed}

\newcommand{\tightspacing}{\renewcommand{\baselinestretch}{0.85}}
\newcommand{\regularspacing}{\renewcommand{\baselinestretch}{1.0}}

% Hyperref extras.

\newcommand{\link}[2]{\literalFont{\href{#1}{#2}}}
\newcommand{\mailto}[1]{\link{mailto:#1}{#1}}

% Lineno options.

\setlength{\linenumbersep}{2.6em}

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

% Spacing of floats.

\setlength{\intextsep}{17pt plus 6pt minus 4pt}

% Margin adjustments. I've tried using vmargin.sty, but it interacts badly
% with page numbers at the bottom of the page, so I've resorted to hardcoding
% the dimensions like this.

\setlength{\marginparwidth}{0 pt}
\setlength{\oddsidemargin}{0 pt}
\setlength{\evensidemargin}{0 pt}
\setlength{\marginparsep}{0 pt}
\ifpdf
  \setlength{\topmargin}{-8 ex}
\else
  \setlength{\topmargin}{1 ex}
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

\def\@putauthorinfo{%
  \large
  \renewcommand{\arraystretch}{0.95}%
  \begin{tabular}[t]{c}%
    \@author
  \end{tabular}}

\def\sbmltableofcontents{%
  \if@notoc
  \else
    \begingroup
      \small%
      % Tighten spacing between lines within an entry.
      % This assumes 10 pt font!
      \setlength{\baselineskip}{9pt}%
      % Now adjust inter-entry spacing.
      \addtolength{\parskip}{-1.35 ex}%
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
  \sbmltableofcontents
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
      \@putauthorinfo
      }%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par%
  \vskip 1.5em%
%  \ifpdf
%    \hypersetup{pdftitle={\@title},pdfauthor={\@author}}
%  \fi%
  }

% Definition of paragraph style.

\setlength{\parindent}{0 pt}            % Unindented paragraphs, separated ...
\setlength{\parskip}{1.3 ex}            % ... by roughly one blank line.
\setlength{\partopsep}{-1ex plus 0.1ex minus -0.2ex}
\setlength{\itemsep}{-0.25ex plus 0.15ex}

% \topsep is supposed to affect list environments like itemize,
% but does nothing there.  Instead, it affects environments like tabular.

\setlength{\topsep}{0.3ex plus 0.1ex minus -0.2ex}

% Definition of section heading style.

\renewcommand{\section}{\@startsection%
  {section}{1}{0pt}{-1.8ex \@plus -1ex \@minus -.2ex}%
  {0.8ex}{\clearpage\normalfont\Large\bfseries\sffamily}}

\renewcommand{\subsection}{\@startsection%
  {subsection}{2}{0pt}{-2ex \@plus 1ex \@minus -.2ex}%
  {0.8ex}{\large\bfseries\sffamily}}

\renewcommand{\subsubsection}{\@startsection%
  {subsubsection}{3}{0pt}{-1.5ex \@plus 1ex \@minus -.2ex}%
  {0.5ex}{\slshape\normalsize\bfseries\sffamily}}

\renewcommand{\paragraph}{\@startsection%
  {paragraph}{4}{0pt}{-1.25ex \@plus 1ex \@minus -.2ex}%
  {0.5ex}{\slshape\normalsize\sffamily}}

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

% The following is a hacked version of @trivlist from latex.ltx
% to try to fix initial spacing problems (\topsep doesn't seem to
% do anything.)

\newlength{\listSpaceAdjustment}
\setlength{\listSpaceAdjustment}{0.9ex}

\def\itemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\def\makelabel##1{\hss\llap{##1}}}%
  \fi
  \vspace*{-\listSpaceAdjustment}}

\def\enumerate{%
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
      \expandafter
      \list
        \csname label\@enumctr\endcsname
        {\usecounter\@enumctr\def\makelabel##1{\hss\llap{##1}}}%
  \fi
  \vspace*{-\listSpaceAdjustment}}

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
\setlength{\captionmargin}{6ex}

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
  \renewcommand{\baselinestretch}{0.9}
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
    \renewcommand{\baselinestretch}{0.9}
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
      \renewcommand{\baselinestretch}{0.9}
      \captionfont%
      \as@caption{{\captionlabelfont #1:}}{#2}}
  \fi
\fi

% Additional new commands.

\newcommand{\D}{\displaystyle}
\newcommand{\tm}{\textsuperscript{\tiny{\texttrademark}}}

\newcommand{\eg}{e.g.,\xspace}
\newcommand{\ie}{i.e.,\xspace}

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

% A list with wider left margins.  Don't ask me to explain the
% combination of arguments because this isn't what I get by reading
% p. 145 of the laTeX Companion 2nd ed.  I found this by trial and
% error.

\newenvironment{sbmlenum}
 {\begin{list}{}
   {\addtolength{\leftmargin}{2ex}
    \addtolength{\itemindent}{-2ex}}}
 {\end{list}}

% The font adjustments on the hline's below are very dependent on the
% font in use.  Use 1.2em for Helvetica, 0.98em (1st) 0.95 (2nd) for
% the default Latex sans serif.

\newenvironment{classbox}[1]{%
  \sffamily%
  \small%
  \setlength{\arrayrulewidth}{0.5pt}
  \begin{tabular}[t]{|l|}
    \hline \\[-1.2em]
    \multicolumn{1}{|c|}{\textbf{#1}}\\
    \hline \\[-1.2em]}
{\hline\end{tabular}}

% Marking changes.

\newcommand{\changed}[1]{\textcolor{\changedColor}{#1}}
\newenvironment{blockChanged}{\color{\changedColor}}{\color{black}}

% Graphics adjustments.  The path setup is so that the \includegraphics
% in the @puttile definition can find the logo file no matter where the
% document is located (but obviously, it only works for certain path
% combinations -- it's a total hack).

\graphicspath{{./logos/}{../tex/logos/}{../project/tex/logos/}{../../project/tex/logos/}{../../../project/tex/logos/}{../../../../project/tex/logos/}}

%% -----------------------------------------------------------------------------
%% End of file `cekarticle.cls'.
%% -----------------------------------------------------------------------------
