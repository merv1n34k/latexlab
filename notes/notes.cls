\NeedsTeXFormat{LaTeX2e}
\ProvidesFile{notes.cls}[2023/08/31 v0.001 Notes]
% Load the amsmath and the before loading microtype
\RequirePackage{amsmath}% better math handling
\LoadClass[twoside,openany]{report}% Use report class
\RequirePackage{sidenotes}% put annotations, tables and figures in the margin
\captionsetup{font=footnotesize, skip=4pt}
\RequirePackage[maxfloats=45]{morefloats}% a lot of marginals need more float 'memory'
\RequirePackage{marginfix}% automatically adjust the side-floats nicely
\RequirePackage[letterspace=150]{microtype}% microtypography


\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage[usenames,dvipsnames,svgnames]{xcolor}
\RequirePackage{xifthen}

%% Helpful packages

% Hide page number when page is empty
\RequirePackage{emptypage}
\RequirePackage{ragged2e} % \RaggedRight works better than \raggedright
\RequirePackage{parskip}


%% Layout setup

\RequirePackage{geometry}
\geometry{
headheight=13pt,
paperwidth=210mm,
paperheight=297mm,
left=42pt,
top=72pt,
textwidth=320pt,
marginparsep=20pt,
marginparwidth=180pt,
textheight=650pt,
footskip=40pt,
}


%% Fontsize setup

\renewcommand{\normalsize}{\fontsize{10pt}{13pt}\selectfont}%
\renewcommand{\footnotesize}{\fontsize{8pt}{10pt}\selectfont}%


%% Fullwidth environment

% fullwidth environment, text across textwidth+marginparsep+marginparwidth
\newlength{\overhang}
\setlength{\overhang}{\marginparwidth}
\addtolength{\overhang}{\marginparsep}
%
\newenvironment{fullwidth}
  {\ifthenelse{\boolean{@twoside}}%
     {\begin{adjustwidth*}{}{-\overhang}}%
     {\begin{adjustwidth}{}{-\overhang}}%
  }%
  {\ifthenelse{\boolean{@twoside}}%
    {\end{adjustwidth*}}%
    {\end{adjustwidth}}%
  }


%% Sidecaption setup

\newcommand{\marginparstyle}{\footnotesize} % initialize style with start value
\long\def\@ympar#1{% redefine margin par to avoid too many macros in the document
  \@savemarbox\@marbox{\marginparstyle#1}% marginparstyle is a prefix to the marginpar text now
  \global\setbox\@currbox\copy\@marbox % the rest of the definition is taken from original LaTeX
  \@xympar}
\renewcommand*{\marginfont}{\marginparstyle}

\RequirePackage{caption}
\RequirePackage[margincaption,outercaption,,wide]{sidecap}
\captionsetup{labelfont={sf,bf}}
\DeclareCaptionStyle{marginfigure}[]{labelfont={sf,bf,footnotesize}, font=footnotesize, justification=justified}
\DeclareCaptionStyle{sidecaption}[]{labelfont={sf,bf,footnotesize}, font=footnotesize, justification=justified, singlelinecheck=off}
\DeclareCaptionStyle{widefigure}[]{labelfont={sf,bf,footnotesize}, font=footnotesize}


%% fancyhdr setup

% This is used for chapters
\RequirePackage{fancyhdr}

% Define custom page style
\fancypagestyle{newstyle}{
  \fancyhf{} % Clear all header and footer fields
  \fancyfoot[LE,RO]{\normalsize\sf\thepage} % Page number in left on even pages and right on odd pages
  \fancyhead[RE]{\normalsize\sf\textit\leftmark} % Chapter name on the right of even pages
  \fancyhead[LO]{\normalsize\sf\rightmark} % Section name on the left of odd pages
  \renewcommand{\headrulewidth}{0.4pt} % Line at the header
  \renewcommand{\footrulewidth}{0pt}  % Line at the footer
}

% Apply the custom page style
\pagestyle{newstyle}

% For the first page of chapters, use the plain page style
\fancypagestyle{plain}{
  \fancyhf{} % clear all header and footer fields
  \fancyfoot[LE,RO]{\normalsize\sf\thepage} % Page number in left on even pages and right on odd pages
  \renewcommand{\headrulewidth}{0pt} % Line at the header invisible
  \renewcommand{\footrulewidth}{0pt} % Line at the footer invisible
}


%% Custom chapter setup

\RequirePackage{titlesec,titletoc}% load the helper package
\titleformat{\chapter}[display]
{\bfseries\Large\sf}
{\filleft}%\textls{\MakeUppercase{\chaptertitlename}}\ \thechapter} % Uncomment to use chapter headings
{1.5ex}
{\titlerule
\vspace*{1.1ex}%
\filright}
[\vspace*{1.5ex}%
\titlerule]


%% Use specific command \note
\def\testdateparts#1{\dateparts#1\relax}
\def\dateparts#1 #2 #3 #4 #5\relax{
    \marginpar{\small\textsf{#1 #2 #3 #5}}
}

\def\@note{}%
\newcommand*{\note}[3]{
    \ifthenelse{\isempty{#3}}{%
        \def\@note{Note #1}%
    }{%
        \def\@note{Note #1: #3}%
    }%
    \chapter{\@note}
    \testdateparts{#2}
}


%% TOC layout setup

\newcommand{\toc}{
    \newgeometry{top = 0.1in, bottom = 0.1in, left = 1in, right = 1in}
    \tableofcontents
    \restoregeometry
}
