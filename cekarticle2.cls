%% Filename    : cekarticle2.cls
%% Description : Version 2 of cekarticle.cls
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

\def\filedate{2002/05/02}
\def\fileversion{"$Revision$"}

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{cekarticle2}[\filedate\space Caltech ERATO Kitano article2 class]

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

\RequirePackage{cekcommon}

% Title style.

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


%% -----------------------------------------------------------------------------
%% End of file `cekarticle2.cls'.
%% -----------------------------------------------------------------------------
