\ProvidesClass{twentyfiveseconds}[2019/09/17 base class]
\LoadClass{article}

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

% Colors

\newcommand{\cvcolor}{cvblue}