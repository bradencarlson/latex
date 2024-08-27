\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}

% provide the \course{} command. 

\def\course#1{\gdef\@course{#1}}
\def\@course{\@latex@error{No \noexpand\course given}\@ehc}

% provide two boolean values,
% that tell us whether or not we are 
% in teacher mode or bellwork mode,
% respectively.

\newif\ifteacherview\teacherviewfalse
\newif\ifbellwork\bellworkfalse

\DeclareOption{teacherview}{
    \teacherviewtrue
}

\DeclareOption{bellwork}{
    \bellworktrue
}

\ProcessOptions\relax 

\LoadClass{article}
\usepackage[margin=1in]{geometry}
\usepackage{amsmath,amssymb,amstext}
\usepackage{mathcommands}
\parindent=0in

\newcounter{problemNumber}
\setcounter{problemNumber}{0}
\newcounter{partNumber}
\setcounter{partNumber}{0}

\newif\ifinProblem\inProblemfalse
\long\gdef\part#1{\par\stepcounter{partNumber}\ifinProblem\leftskip=5em\alph{partNumber}\else\leftskip=2em\alph{partNumber}\fi)\hspace{1em} #1\par}

\newenvironment{problem}{
    \inProblemtrue
    \setcounter{partNumber}{0}
    \stepcounter{problemNumber}\textbf{\theproblemNumber}\hspace{1em} 
}{
    \setcounter{partNumber}{0}
    \inProblemfalse
    \par
}

\long\def\answer#1{
    \ifteacherview
        #1
    \else
    \fi
}


\renewcommand{\maketitle}{
    {\Large\@title}\\
    {\@course\hfill\ifteacherview KEY\else Name: \underline{\hspace{1.5in}}\fi}\\
    \rule{\textwidth}{.4pt}
    \vspace{.05in}
}
