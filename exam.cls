\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exam}

% defines the \course{} command 

\def\course#1{\gdef\@course{#1}}
\def\@course{\@latex@error{ No \noexpand\course defined}\@ehc}


\DeclareOption{10pt}{ % this is the default.
    \PassOptionsToClass{\CurrentOption}{article}
}

\DeclareOption{12pt}{ 
    \PassOptionsToClass{\CurrentOption}{article}
}

% execute the 10pt option, making this the default

\ExecuteOptions{10pt}
\ProcessOptions\relax

\LoadClass{article}
\usepackage[margin=1in]{geometry}
\usepackage{amsmath,amssymb,amstext}


\renewcommand{\maketitle}{
    \begin{center}
        {\Large\textbf{\@title}}\\
        \@author\\
        \@course\\
        \rule{4in}{.4pt}
    \end{center}
}

\newif\ifinProblem
\inProblemfalse

\newcounter{partNumber}
\setcounter{partNumber}{0}
\long\def\part#1{\stepCounter{partNumber}\par\ifinProblem \leftskip=40pt \else \leftskip=10pt\fi \alph{partNumber}. #1\par}

\newenvironment{problem}[1]{
    \inProblemtrue
    \par\textbf{#1}\hspace{.1in}\setCounter{partNumber}{0}
}{
    \par
    \setCounter{partNumber}{0}
    \inProblemfalse
}
