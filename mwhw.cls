%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Felipe Portales' HomeWorks
% Maintainer: Felipe Portales-Oliva (f.portales.oliva@gmail.com)
% 
% Document class to produce simple yet stylish homework submissions 
%
% This package is public domain, according to :
%    The Unlicense <https://unlicense.org>
%
% Modfied based on fphw
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Identification

\NeedsTeXFormat{LaTeX2e} % we need to have LaTeX2e for this to compile
\ProvidesClass{mwhw}[2020/04/12] % mwshw is the name we need to provide to 
                                  % the documentclass command on the .tex file

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Enhanced datetime
% % compile with XeLatex

\usepackage{datetime} %datetime
\renewcommand{\today}{ \number\year 年 \number\month 月 \number\day 日}

%%% Preliminary declarations:
%%%% These are some commands where we declare new commands for the class

% We define the macro for the name of the professor
\newcommand{\professor}[1]{ \newcommand{\professorloc}{#1} }
% We define the macro for the name of the course
\newcommand{\class}[1]{ \newcommand{\classlocal}{#1} }
% We define the macro for the name of the institution
\newcommand{\institute}[1]{ \newcommand{\instituteloc}{#1} }
% We define the macro for the ID of you
\newcommand{\IDnumber}[1]{ \newcommand{\IDnumberloc}{#1} }
% We define the macro for the classID of you
\newcommand{\classID}[1]{ \newcommand{\classIDloc}{#1} }

%these are auxiliary definitions used in the title section
\newcommand{\CourseLang}{Course}
\newcommand{\DateLang}{Due Date}
\newcommand{\StudentLang}{Student name}
\newcommand{\ProfessorLang}{Professor}
\newcommand{\IDnumberLang}{ID}
\newcommand{\classIDLang}{classID}

% Header and footers, we will use the titles also
\RequirePackage{fancyhdr}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Options
%%%% We now pass the options of the class

% Two Columns are difficult to read and grade, we will not use them
\DeclareOption{twocolumn}{\OptionNotUsed}

% Two sided paper are difficult to read and grade, we will not use them
\DeclareOption{twoside}{\OptionNotUsed}


% we hardcode some language options
\DeclareOption{spanish}{
    \renewcommand{\CourseLang}{Curso}
    \renewcommand{\ProfessorLang}{Docente}
    \renewcommand{\DateLang}{Fecha de entrega}
    \renewcommand{\StudentLang}{Nombre estudiante}
}

% Chinese options
\DeclareOption{cn}{
    \renewcommand{\CourseLang}{课程}
    \renewcommand{\ProfessorLang}{教授}
    \renewcommand{\DateLang}{日期}
    \renewcommand{\StudentLang}{姓名}
    \renewcommand{\IDnumberLang}{学号}
    \renewcommand{\classIDLang}{班级}
}


\PassOptionsToClass{a4paper}{article}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Bulk Declarations
%%%% Here we do more declarations and call other files


% we need to load 
\LoadClass{article}


% we will modify sections, subsections and sub subsections
\RequirePackage{titlesec}
% Modification of section 
\titleformat{\section}[block]{\normalsize\bfseries}{\thesection.}{.3cm}{} 

% modification of subsection and sub sub section
\titleformat{\subsection}[runin]{\bfseries}{ \thesubsection.}
{1mm}{}[:\quad]
\titleformat{\subsubsection}[runin]{\bfseries\itshape}{ \thesubsubsection.}
{1mm}{}[:\quad]

% Geometry lets us modify the sizes of the document nicely
\RequirePackage{geometry}
% Decent margins for the documents, as it is meant to be printed
\geometry{left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm}

\fancyhead{}
\fancyfoot{}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.4pt} % we want rules 
\renewcommand{\footrulewidth}{0.4pt}
\fancyhead[RO] {\footnotesize\thepage}
\fancyhead[LO] {\footnotesize{\ifx\classlocal\undefined{}\else\itshape\classlocal{} --{} \fi}\makeatletter\@title\makeatother }
\fancyfoot[RO] {\footnotesize\itshape\makeatletter\@author\makeatother}

% New title style for the document
\renewcommand{\maketitle}{%
    \thispagestyle{plain}
    \begin{center}
        \ifx\instituteloc\undefined{}\else{\scshape \instituteloc} \\[10pt] \fi
        \hrule
        \vspace{10pt}
        {\LARGE \bfseries \@title} \\[5pt]
        \StudentLang: {\itshape \@author}
        \ifx\classIDloc\undefined{}\else \quad \classIDLang: {\itshape \classIDloc{}}\fi
        \ifx\IDnumberloc\undefined{}\else \quad \IDnumberLang: {\itshape \IDnumberloc{}}\fi
        \vspace{8pt}
        \hrule
        \vspace{10pt}
        \ifx\classlocal\undefined{}\else\CourseLang: {\itshape \classlocal{} \ifx\professorloc\undefined{}\else{\quad}\fi  }\fi
        \ifx\professorloc\undefined{}\else{\ProfessorLang: {\itshape\professorloc}}\fi 
        \ifx\classlocal\undefined{}\else{\quad}\fi
        \DateLang: {\itshape\@date}
        \vspace{15pt}
    \end{center}
}

% definition of the "problem" environment
\usepackage[most]{tcolorbox}

\newsavebox{\problembox}
\newenvironment{problem}
    {\begin{center} \begin{minipage}{.98\textwidth}\begin{tcolorbox}[enhanced]}
    {\end{tcolorbox}\end{minipage} \end{center} }

%%% We finish the class with this command
\endinput
