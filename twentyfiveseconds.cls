\ProvidesClass{twentyfiveseconds}[2019/09/17 base class]
\LoadClass[a4paper]{article}

\NeedsTeXFormat{LaTeX2e}

% Packages

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage{xcolor}
\RequirePackage[absolute, overlay]{textpos}
\RequirePackage{twentyfivesecond}
\RequirePackage{geometry}
\RequirePackage{tikz}
\RequirePackage{calc}

\usetikzlibrary{calc}

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

% Colors

\newcommand{\cvcolor}{cvblue}