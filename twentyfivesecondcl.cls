\ProvidesClass{twentyfivesecondcl}[2019/09/17 CV class]
\LoadClass{twentyfiveseconds}
\NeedsTeXFormat{LaTeX2e}

% user input
\newcommand{\@firstname}{Alice}
\newcommand{\@familyname}{}
\newcommand{\@addressstreet}{}
\newcommand{\@addresscity}{}

\newcommand{\@mobile}{}
\newcommand{\@email}{}
\newcommand{\@birth}{}

\newcommand{\@name}{\@firstname ~ \@familyname}

\newcommand{\firstname}[1]{\renewcommand{\@firstname}{#1}}
\newcommand{\familyname}[1]{\renewcommand{\@familyname}{#1}}
\newcommand{\addressstreet}[1]{\renewcommand{\@addressstreet}{#1}}
\newcommand{\addresscity}[1]{\renewcommand{\@addresscity}{#1}}
\newcommand{\mobile}[1]{\renewcommand{\@mobile}{#1}}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
\newcommand{\birth}[1]{\renewcommand{\@birth}{#1}}


% HEADER

\newcommand{\makeheader}{
	\@makeheader{}{%
		\color{white}
		%    %\vspace{1cm}
		\begin{center}
		\noindent {\Huge \@name}\\
		\vspace{1em}
		\begin{tabular}{r|l}
			\@addressstreet & \@mobile \\
			\@addresscity & \@email
		\end{tabular}
		\vspace*{2pt}%Space after
		\end{center}
	}
}

% LENGTH

\setlength{\headerheight}{35mm}