%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX document class: ltuthesis.cls
%% 
%% Current version: 1.0
%% Last modified by: Roland Hostettler, December 14, 2012
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Identification & Options Handling
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% LaTeX requirement
\NeedsTeXFormat{LaTeX2e}

%% Class identification
\ProvidesClass{ltuthesis}[2014/04/08 Roland's Lic/PhD thesis class]

% Enable thumbmarks
\DeclareOption{thumbmarks}{%
	\AtBeginDocument{%
		\renewcommand{\thumbmark}{\fancytab{}{\value{chapter}}}
	}
}

%% Forward all the unknown options to our parent & process them
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% General Classes and Packages
%% ============================
%% Note: More packages are loaded further down when they're needed
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass{book}
\RequirePackage[includehead,includefoot,top=20mm,left=20mm,right=20mm,bottom=20mm,a4paper]{geometry}
\RequirePackage{fancyhdr}		% fancy headers
\RequirePackage{titletoc}		% ToC formatting
\RequirePackage{amsmath}		% advanced mathematics
\RequirePackage{keyval}
\RequirePackage{bibunits}

% Thumbmarks
\RequirePackage{fancytabs}
\fancytabsLeftColor{black}
\fancytabsRightColor{black}
%\fancytabsHeight{} % default: 4cm
%\fancytabsWidth{} % default: 1cm
\newcommand{\thumbmark}{}

% Fonts
%\RequirePackage{avant}
%\RequirePackage{tgheros}   % <- Closest to Helvetica neue (i suppose)
\RequirePackage{tgadventor}
\RequirePackage{tgpagella} % <- Closest "standard" LaTeX font to Bembo
\RequirePackage[T1]{fontenc}


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% General Formatting
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Orphans and widow control
%\clubpenalty10000
%\widowpenalty10000


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Title Formatting
%% ================
%%
%% We use the 'titlesec' package for this. The advanced interface using
%% '\titleformat' is:
%% 
%% \titleformat{command}[shape]{format}{label}{sep}{before}[after]
%%   * command   Self-explanatory
%%   * shape     Paragraph shape
%%   * format    Format to be applied to the whole title including label and
%%               text. This part can contain vertical material which is typeset
%%               just after the space above the title
%%   * label     Defines the label, leave empty for no label.
%%   * sep       Horizontal separation between label and title body (a length,
%%               must not be empty).
%%   * before    Code preceding the title body.
%%   * after     Code following the title body.
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Load the package
\RequirePackage{titlesec}

% Part
\titleformat{\part}[display]{\sffamily\raggedleft \Huge}{\partname\ \thepart}{0pt}{}

% Regular chapter formatting
% => "Chapter X" is inside the "bars"
\titleformat{name=\chapter}[display]{\sffamily\raggedleft\hrule\vspace{5pt}\Huge}{\scshape \chaptertitlename\ \thechapter \hrule}{10pt}{}

% Starred chapter formatting
% => Chapter name is inside the "bars" (Abstract, Contents, References, etc.) 
\titleformat{name=\chapter,numberless}[hang]{\sffamily\raggedleft\hrule\vspace{5pt}\Huge\scshape}{}{0pt}{}[\hrule]

% Extra: Reset chapter numbers when starting a new part
\@addtoreset{chapter}{part}

% Section
\titleformat{\section}[hang]{\sffamily\Large}{\thesection\ }{0pt}{\Large}

% Subsection
\titleformat{\subsection}[hang]{\sffamily\large}{\thesubsection\ }{0pt}{\large}

% Subsubsection
\titleformat{\subsubsection}[hang]{\sffamily}{}{0pt}{\sffamily}


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Table of Contents Formatting
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Global: Print "Part #", e.g. "Part I" instead of just "I"
%\titlecontents{section}[left]{above}{before w/ label}{before w/o label}{filler and page}[after]
\titlecontents{part}[0pt]{\addvspace{26pt}}{}{\large \bfseries \partname\ \thepart}{}[]


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Page Formatting
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Make fancy headings
\setlength{\headheight}{15.2pt}
\pagestyle{fancy}

%% Regular headings
\fancyhf{}
\fancyhead[LE,RO]{\thepage}
\fancyhead[RE]{\textsc{\nouppercase{\leftmark}}}
\fancyhead[LO]{\textsc{\nouppercase{\rightmark}}}

%% Make plain pages truly empty
\fancypagestyle{plain}{
	\fancyhf{}							% remove everything
	\renewcommand{\headrulewidth}{0pt}	% remove lines as well
	\renewcommand{\footrulewidth}{0pt}
}

%% Redefine the \cleardoublepage command so that clear pages use the "empty" pagestyle
\renewcommand{\cleardoublepage}[0]{
	\clearpage
	\if@twoside
		\ifodd
			\c@page
		\else
			\hbox{}
			\thispagestyle{empty}
			\newpage
			\if@twocolumn
				\hbox{}
				\newpage
			\fi
		\fi
	\fi
}


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Front Matter (Title, Dedication, Abstract, ToC, and Acknowledgements)
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Title
\renewcommand{\title}[1]{
	\def\thetitle{#1}
}
\title{On the Difficulty of Finding Two Identical Snowflakes}

%% Author
\renewcommand{\author}[1]{
	\def\theauthor{#1}
}
\author{John Doe}

%% Address
\newcommand{\address}[1]{
	\def\theaddress{#1}
}
\address{Department of Snowflake Studies\\
	Division of Snowflake Re-Identification\\
Snowland, North Pole}

%% Date
\renewcommand{\date}[1]{
	\def\thedate{#1}
}
\date{\today}

%% Supervisors
\newcommand{\supervisors}[1]{
	\def\thesupervisors{#1}
}
\supervisors{Professor Snowman and Associate Professor Yeti}

%% Dedication
\newenvironment{dedication}{
	\pagenumbering{Roman}  % use capital roman page numbering (I, II, etc.)
	\thispagestyle{plain}
	\vspace*{10cm}
	\raggedleft \itshape
}{
	\cleardoublepage       % empty pages
	\pagenumbering{arabic} % set the page numbering to arabic (1, 2, ...)
}

%% Abstract
\newenvironment{abstract}{
	\pagenumbering{Roman}  % use capital roman page numbering (I, II, etc.)
	\chapter*{Abstract}    % add the abstract title
}{
	\cleardoublepage       % empty pages
	\pagenumbering{arabic} % set the page numbering to arabic (1, 2, ...)
}

%% Acknowledgments
\newenvironment{acknowledgments}{
	\pagenumbering{Roman}      % use capital roman page numbering (I, II, etc.)
	\chapter*{Acknowledgments} % add the acknowledgments title
}{
	\cleardoublepage           % empty pages
	\pagenumbering{arabic}     % set the page numbering to arabic (1, 2, ...)
}

%% Titlepage
\renewcommand{\maketitle}{
	\renewcommand{\thepage}{t1}
	% The title page
	\begin{titlepage}
		\thispagestyle{empty}
		\begin{center}
			\vspace*{1cm} \mbox{}\hrulefill \mbox{}\\[2.5cm] % Vertical line
			{\sffamily\Huge \textbf{\thetitle\\[2.5cm]}}              % Title
			{\sffamily\LARGE \textbf{\theauthor}}\\[2.25cm]           % Author
			{\large \theaddress}\\[5.5cm]                   % Address
%			{\large \theaddress}\\[2.25cm]                   % Address
%			{\large \thedate}\\[2.25cm]                      % Date
			{\large \mbox{}\hrulefill\mbox{}}\\[1cm]         % Vertical line
			{\sffamily\large \textbf{Supervisors:}}\\[0.5cm]          % Supervisors line
			{\large \thesupervisors}                         % Supervisors
		\end{center}
	\end{titlepage}	

	% Blank page at the back of the title
	\newpage
	\thispagestyle{empty}
	\renewcommand{\thepage}{t2}
	\mbox{}
	\newpage
}

%% Table of Contents
\let\oldtoc\tableofcontents
\setcounter{tocdepth}{1}
\renewcommand{\tableofcontents}[0]{
	\pagenumbering{Roman} % use capital roman page numbering (I, II, etc.)
	\pdfbookmark{\contentsname}{toc}
	\oldtoc
	\cleardoublepage       % advance to a new page
	\pagenumbering{arabic} % set the page numbering to arabic (1, 2, ...)
}


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Kappa
%% =====
%% The 'intro'-environment. Starts a new part (Part I) and creates a global list 
%% of references at the end of the part.
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{intro}{
	\part{}
	\begin{bibunit}
}{
	\cleardoublepage
	\renewcommand{\bibname}{References}
	\phantomsection
	\addcontentsline{toc}{chapter}{References}
	\putbib
	\end{bibunit}
}


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Papers
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Reformat header and footers
%\renewcommand{\sectionmark}[1]{
%	\markboth{\arabic{section}\ #1}{}
%}

%% Command to switch to papers mode -> reformats a great deal of stuff
\newcommand{\paperssetup}[0]{
	% Reformat titles
	\renewcommand{\chaptername}{Paper}
	
	% Reformat bibliography
	\renewcommand{\bibname}{References}
	\let\stdthebibliography\thebibliography
	\renewcommand{\thebibliography}{%
		\let\chapter\section%
		\stdthebibliography%
	}

	% Reformat ToC (Chapter entries only)
	%\titlecontents{section}[left]{above}{before w/ label}{before w/o label}{filler and page}[after]
	\titlecontents{chapter}[0pt]{\addvspace{12pt}}{\bfseries}{}{\bfseries\hfill\contentspage}

	% Reformat headers
	\renewcommand{\chaptermark}[1]{\markboth{\chaptertitlename\ \Alph{chapter}}{}}
%	\renewcommand{\sectionmark}[1]{\markright{\thesection\  ##1}}

	% Reformat caption labels
	\renewcommand{\thefigure}{\arabic{figure}}
	\renewcommand{\thetable}{\arabic{table}}
	\renewcommand{\theequation}{\arabic{equation}}
	\renewcommand{\thesection}{\arabic{section}}
	\renewcommand{\thechapter}{\Alph{chapter}}

	% Renew the abstract environment in order to use it in the articles
	\renewenvironment{abstract}{
		\begin{center}
%			\begin{minipage}{0.9\textwidth}
			\begin{minipage}{\textwidth}
			\hrule
			\vspace*{8pt}
			\textbf{Abstract:}%
	}{
			\vspace*{8pt}
			\hrule
			\end{minipage}
		\end{center}
	}
}

%% The 'papers' environment, wrapping all of the above. Starts a new part 
%% ('Part II') and redefines lots of commands to fit the formatting for the 
%% papers
\newenvironment{papers}{
	\part{}
	\paperssetup
}{
}

%% Option keys for \includepaper
% Paper title
\newcommand{\papertitle}[1]{
	\def\thepapertitle{#1}
}
\papertitle{}
\define@key{paper}{title}{\papertitle{#1}}

% Paper authors
\newcommand{\paperauthor}[1]{
	\def\thepaperauthor{#1}
}
\paperauthor{}
\define@key{paper}{author}{\paperauthor{#1}}

% Paper type
\newcommand{\papertype}[1]{
	\def\thepapertype{#1}
}
\papertype{published in}
\define@key{paper}{published}[true]{\papertype{originally published in}}
\define@key{paper}{accepted}[true]{\papertype{accepted for publication in}}
\define@key{paper}{submitted}[true]{\papertype{submitted to}}

% Publisher
\newcommand{\paperpublisher}[1]{
	\def\thepaperpublisher{#1}
}
\paperpublisher{}
\define@key{paper}{journal}[true]{\paperpublisher{#1}}
\define@key{paper}{conference}[true]{\paperpublisher{#1}}

% Copyright
\newcommand{\papercopyright}[1]{
	\def\thepapercopyright{#1}
}
\papercopyright{}
\define@key{paper}{copyright}{\papercopyright{#1}}

%% Paper inclusion command
\newcommand{\includepaper}[2][]{
	% Process the options
	\setkeys{paper}{#1}

	% Create paper title page
	\cleardoublepage
	\chapter[Paper \Alph{chapter}]{\thepapertitle}
	\label{paper:\Alph{chapter}}
	\thumbmark 	% Add a thumbmark

	% Include paper info
	\vspace*{3cm}
	\noindent
	\textbf{Authors:}\\
	\thepaperauthor\\
	%
	\vspace*{0.6cm}\\
	\textbf{Reformatted version of paper \thepapertype:}\\
	\thepaperpublisher\\
	%
	\vspace*{0.6cm}\\
	\copyright~\thepapercopyright, reprinted with permission.
	
	% Create the paper title
	\cleardoublepage
	\thispagestyle{plain}
	\begin{center}
%		\textbf{\LARGE \thepapertitle}\\[0.8cm]
		{\sffamily \LARGE \thepapertitle}\\[0.8cm]
		\thepaperauthor\\[1cm]
	\end{center}

	% Star a new bibliography unit
	\begin{bibunit}

	% Include the paper main file
	\input{#2}

	% Put the bibliography in place
	%\putbib
	\end{bibunit}

	% End of paper
}


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% EOF
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
