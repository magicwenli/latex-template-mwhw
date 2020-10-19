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

% 

%%% Identification

\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{mwhw}[2020/10/15 version 1.1] 
\typeout{The template provided by magicwenli}
\LoadClass[12pt]{article}
\newif\if@decoration
\newif\if@opensource
\newif\if@sourcefont


\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{unicode-math}
\RequirePackage{tikz}
\usetikzlibrary{calc,backgrounds}
\RequirePackage{tcolorbox,tabu}
\tcbuselibrary{most}
\RequirePackage{lastpage}
\RequirePackage{enumerate}
\RequirePackage{pifont}
\RequirePackage{appendix}
\RequirePackage{longtable}
\RequirePackage{fontspec}
\RequirePackage{xcolor}
\RequirePackage{datetime} %datetime
\RequirePackage{multirow}
\RequirePackage{booktabs}

\DeclareOption{color}{}
\DeclareOption{parskip}{
  \setlength\parskip{0.2\baselineskip}}
\DeclareOption{decoration}{\@decorationtrue}
\DeclareOption{opensource}{\@opensourcetrue}
\DeclareOption{sourcefont}{\@sourcefonttrue}
\newtoks\subtitle

% 列表


% 设置纸张类型与大小
\DeclareOption{a4paper}{
  \setlength\paperheight{297mm}%
  \setlength\paperwidth{210mm}}
\DeclareOption{b5paper}{
  \setlength\paperheight{250mm}%
  \setlength\paperwidth{176mm}}
 
% 字体
\ProcessOptions
\if@sourcefont
  \RequirePackage[SlantFont]{xeCJK}
  \RequirePackage[heading]{ctex}
  \setCJKmainfont{思源宋体 CN}
  \setCJKsansfont{思源黑体 CN}
\else
  \RequirePackage[heading]{ctex}
\fi
%\setmainfont{Cambria}       % 目前默认使用的serif字体
\setsansfont{Calibri}       % 目前默认使用的sans-serif字体
\setmonofont{Courier New}   % 目前默认使用的等宽字体
\setmathfont{Cambria Math}  % 与正文字体相适应的数学字体

\renewcommand{\thefootnote}{\textbf{(\arabic{footnote})}}

% 设置图片格式
\RequirePackage{graphicx}
\graphicspath{{./figure/}{./pic/}{./image}}
\setlength{\textfloatsep}{6pt plus 2pt minus 4pt}
\setlength{\intextsep}{6pt plus 2pt minus 2pt}

% 设置表格
\RequirePackage{longtable}
\tcbuselibrary{listings,theorems,skins}

% 页边距
\RequirePackage{geometry}
\geometry{margin=1in}

% 引用高亮
\RequirePackage{hyperref}
\hypersetup{
  breaklinks,
  unicode,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdfborder={0 0 0},
  linktocpage,
  pageanchor=true
}
   
% codes
\usepackage{listings}
\colorlet{mygray}{black!30}
\colorlet{mygreen}{green!60!blue}
\colorlet{mymauve}{red!60!blue}

\lstset{
  language=c, 
%  backgroundcolor=\color{gray!3},  
  basicstyle=\ttfamily,
  columns=fullflexible,
  breakatwhitespace=false,      
  breaklines=true,                
  captionpos=b,                    
  commentstyle=\color{mygreen}, 
  extendedchars=true,              
%  frame=single,                   
  keepspaces=true,             
  keywordstyle=\color{blue},                      
  numbers=left,                
  numbersep=5pt,                   
  numberstyle=\color{black!45}, 
  rulecolor=\color{mygray},        
  showspaces=false,               
  showtabs=false,                 
  stepnumber=1,                  
  stringstyle=\color{mymauve},    
  tabsize=4,                      
  title=\lstname                
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Enhanced datetime
% % compile with XeLatex

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



% we will modify sections, subsections and sub subsections
\RequirePackage{titlesec}
% Modification of section 
\titleformat{\section}[hang]{\centering\large\bfseries}{\thesection.}{.2cm}{} 

% modification of subsection and sub sub section
\titleformat{\subsection}[hang]{\bfseries}{\thesubsection.}{1mm}{}
\titleformat{\subsubsection}[hang]{\bfseries\itshape}{ \thesubsubsection.}{1mm}{}

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
        \vspace{5pt}
    \end{center}
}

\newtcolorbox{problem}[2][]{coltitle=red!70!black, title={#2.},fonttitle=\bfseries,detach title,before upper={\tcbtitle\quad},breakable,#1}
%\newsavebox{\problembox}
%\newenvironment{problem}
%    {\begin{center} \begin{minipage}{.98\textwidth}\begin{tcolorbox}[enhanced]}
%    {\end{tcolorbox}\end{minipage} \end{center} }

%%% We finish the class with this command
\endinput
