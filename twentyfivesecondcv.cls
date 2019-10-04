\ProvidesClass{twentyfivesecondcv}[2019/09/17 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}


% Packages

\RequirePackage{xcolor}
\RequirePackage{calc}
\RequirePackage[sfdefault]{ClearSans}
\RequirePackage{tabularx}
\RequirePackage{marvosym}
\RequirePackage{geometry}
\RequirePackage{tikz}
\RequirePackage[absolute, overlay]{textpos}
\RequirePackage{fontawesome}
\RequirePackage{etoolbox}
\RequirePackage{titlesec}
%\RequirePackage[all]{background}
\RequirePackage{everypage}

\usetikzlibrary{calc}

% Colors

\definecolor{cvblue}{HTML}{0E5484}

% Defaults

%% colors
\newcommand{\cvcolor}{cvblue}
\newcommand{\sectioncolor}{\cvcolor}

%% user input
\newcommand{\@cvtitle}{Resumé}
\newcommand{\@firstname}{Alice}
\newcommand{\@familyname}{}
\newcommand{\@addressstreet}{}
\newcommand{\@addresscity}{}

\newcommand{\@mobile}{}
\newcommand{\@email}{}
\newcommand{\@birth}{}
\newcommand{\@profilepic}{}

\newcommand{\@name}{\@firstname ~ \@familyname}

\newcommand{\cvtitle}[1]{\renewcommand{\@cvtitle}{#1}}
\newcommand{\firstname}[1]{\renewcommand{\@firstname}{#1}}
\newcommand{\familyname}[1]{\renewcommand{\@familyname}{#1}}
\newcommand{\addressstreet}[1]{\renewcommand{\@addressstreet}{#1}}
\newcommand{\addresscity}[1]{\renewcommand{\@addresscity}{#1}}
\newcommand{\mobile}[1]{\renewcommand{\@mobile}{#1}}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
\newcommand{\birth}[1]{\renewcommand{\@birth}{#1}}

\newcommand{\profilepic}[1]{\renewcommand{\@profilepic}{#1}}

% Options

\DeclareOption{blue}{
	\renewcommand{\cvcolor}{cvblue}
}

\DeclareOption{black}{
	\renewcommand{\cvcolor}{black}
}

\DeclareOption{bluesectiontext}{
	\renewcommand{\sectioncolor}{cvblue}
}

\DeclareOption{blacksectiontext}{
	\renewcommand{\sectioncolor}{black}
}

\DeclareOption{bluesection}{
	\newcommand{\sectionbgcolor}{cvblue}
}


\ProcessOptions\relax

% Lengthes

\newlength{\outermargin}
\setlength{\outermargin}{15mm}
\newlength{\headerheight}
\setlength{\headerheight}{50mm}
\newlength{\bodytop}
\setlength{\bodytop}{\dimexpr(\outermargin+\headerheight+5mm)}
\newlength{\footheight}
\setlength{\footheight}{25mm}
\newlength{\marginwidth}
\setlength{\marginwidth}{25mm}

%% textpos settings
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

% Format Page

\geometry{%
  top=\bodytop,%
  left=\outermargin, %
  right=\outermargin,
  bottom=\outermargin+\footheight,
  nohead,% no space for header
  nofoot,% no space for footer
  %showframe% show the page layout, only debugging purpose
}

\pagestyle{empty}


% Section Formatting

\titleformat{\section}[leftmargin]{\normalfont\sffamily\bfseries}%
{}{0mm}{}{}

%% sectionbackground
\ifdefined\sectionbgcolor
\renewcommand{\sectioncolor}{white}
\AddEverypageHook{%
	\tikz[remember picture, overlay]{%
		\coordinate (PNW) at (current page.north west);
		\coordinate (PSW) at (current page.south west);
		\fill [\sectionbgcolor, inner sep=0pt, outer sep=0pt] ($(PNW) + (\outermargin, -\headerheight-\outermargin-5mm)$) rectangle ($(PSW) +(\outermargin+\marginwidth+7.5mm, \outermargin+5mm+\footheight)$){};
	}%
}
\fi
%             command   left before-sep                  after-sep .. right-sep
\titlespacing{\section}{\marginwidth-5mm}{*4}{5mm}
%% quickfix for not accepted sectioncolor
\newcommand{\cvsection}[1]{\section{\color{\sectioncolor} #1}}



% Header

\newcommand{\makeheader}
{
    \begin{tikzpicture}[remember picture, overlay]
        \coordinate (PNW) at (current page.north west);
        \coordinate (PNE) at (current page.north east);
        \fill [\cvcolor, inner sep=0pt, outer sep=0pt] ($(PNW) + (\outermargin, -\outermargin)$) rectangle ($(PNE) -(\outermargin, \outermargin+\headerheight)$){};
        \node[anchor=east, inner sep=0pt, outer sep=0pt] at ($(PNE) - (\outermargin+5mm, \outermargin+\headerheight/2)$) {\includegraphics[height=\headerheight]{alice}};
    \end{tikzpicture}
    
    \begin{textblock*}{\textwidth}(\outermargin+5mm, \outermargin+5mm)
    \color{white}
%    %\vspace{1cm}
    \noindent {\Huge \@name}\\
    {\small \@birth}\\
    \vspace{1cm}

    \noindent \@addressstreet\\
    \@addresscity\\
    \Telefon ~ \@mobile\\
    \Letter ~ \@email
    %
    \end{textblock*}%
}

% Content definition

%% increase leftskip
\newenvironment{body}{\par\setlength{\leftskip}{\marginwidth+5mm}}

%% cvline

\newcommand{\cvline}[2]{%
	\begin{tabular}[t]{@{}L{4cm}L{\textwidth-\marginwidth-4cm-15mm}@{}}%
		#1 & #2 %
	\end{tabular}\par%
}

\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}

% Footer

\newcommand{\makefooter}[1]{
    \begin{tikzpicture}[remember picture, overlay]
    \coordinate (PSW) at (current page.south west);
    \coordinate (PSE) at (current page.south east);
    \fill [\cvcolor, inner sep=0pt, outer sep=0pt] ($(PSW) + (\outermargin, \outermargin+\footheight)$) rectangle ($(PSE) +(-\outermargin, \outermargin)$){};
    \end{tikzpicture}

    \begin{textblock*}{\paperwidth}(\outermargin+5mm, \paperheight-\outermargin-\footheight+5mm)
    \noindent \color{white}
        #1
    \end{textblock*}
}

