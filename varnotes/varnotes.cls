\NeedsTeXFormat{LaTeX2e}
\ProvidesFile{varnotes.cls}[2023/08/31 v0.001 Another Notes class]
% Load the amsmath and the before loading microtype
\RequirePackage{amsmath}% better math handling
\LoadClass[oneside,openany]{report}% Use report class
\RequirePackage[letterspace=150]{microtype}% microtypography

\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage[usenames,dvipsnames,svgnames]{xcolor}
\RequirePackage{xifthen}

%% helpful packages

\RequirePackage{emptypage}
\RequirePackage{ragged2e} % \RaggedRight works better than \raggedright
\RequirePackage{parskip}

%% Use \twocol command to easily create twocolumns (will be automated with markdown)

\RequirePackage{multicol}

\newcommand{\twocol}[1]{%
  \begin{multicols}{2}
    #1
  \end{multicols}
}


%% Layout setup

\RequirePackage{geometry}
\geometry{
headheight=14pt,
a4paper}


%% Fontsize setup

\renewcommand{\normalsize}{\fontsize{10pt}{13pt}\selectfont}%
\renewcommand{\footnotesize}{\fontsize{8pt}{10pt}\selectfont}%


%% fancyhdr setup

% This is used for chapters
\RequirePackage{fancyhdr}

% Define custom page style
\fancypagestyle{newstyle}{
  \fancyhf{} % Clear all header and footer fields
  \fancyfoot[R]{\normalsize\sf\thepage} % Page number in left on even pages and right on odd pages
  \fancyfoot[L]{\normalsize\sf\leftmark} % Chapter name on the right of even pages
  \fancyhead[L]{\normalsize\sf\rightmark} % Section name on the left of odd pages
  \renewcommand{\headrulewidth}{0.4pt} % Line at the header
  \renewcommand{\footrulewidth}{0.4pt}  % Line at the footer
}

% Apply the custom page style
\pagestyle{newstyle}

% For the first page of chapters, use the plain page style
\fancypagestyle{plain}{
  \fancyhf{} % clear all header and footer fields
  \fancyfoot[C]{\normalsize\sf\thepage} % Page number in left on even pages and right on odd pages
  \renewcommand{\headrulewidth}{0pt} % Line at the header invisible
  \renewcommand{\footrulewidth}{0pt} % Line at the footer invisible
}

%% Caption setup
\RequirePackage{caption}
\captionsetup{labelfont={sf,bf}}


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

\newcommand*{\toc}{
    \newgeometry{top = 0.1in, bottom = 0.1in, left = 1in, right = 1in}
    \tableofcontents
    \restoregeometry
}
