\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}
\RequirePackage{xcolor}

% Provides the \course{} command for the title.
\def\course#1{\gdef\@course{#1}}
\def\@course{\@latex@error{No \noexpand\course given}\@ehc}

% Provides the option for 12pt font.
\DeclareOption{12pt}{
    \PassOptionsToClass{\CurrentOption}{article}
}
% Provides the option for 10pt font, this is the default.
\DeclareOption{10pt}{
    \PassOptionsToClass{\CurrentOption}{article}
}

% Creates a new if, to be used in the assignment/exam options.
\newif\ifexam
\examfalse

% Provides the homework option, this is the default.
\DeclareOption{homework}{
    \examfalse
}
% Provides the exam option.
\DeclareOption{exam}{
    \examtrue
}

% defines a new if, to be used in the teacher/student options
% this will be used to determine wheather the title and other options will print
% in a format that the teacher sees or what the student should see.
\newif\ifteacher
\teacherfalse


% defines the teacher option, this is the default
\DeclareOption{teacher}{
    \teachertrue
}
% defines the student option
\DeclareOption{student}{
    \teacherfalse
}


\newif\ifmargins
\marginsfalse
\DeclareOption{halfinchmargins}{
    \marginsfalse
}
% this is the default
\DeclareOption{inchmargins}{
    \marginstrue
}

% Execute the default options
\ExecuteOptions{10pt}
\ExecuteOptions{homework}
\ExecuteOptions{teacher}
\ExecuteOptions{inchmargins}

% process the options given in the document
\ProcessOptions\relax

\LoadClass{article}

% If the exam option is selected, then format the title this way:
\ifexam
    \ifteacher    
        \renewcommand{\maketitle}{
            \begin{center}{\Large \textbf{\@title}}\\
            {\@author}\\    % author is required when using teacher mode
            {\@course}\\
            {\rule{4in}{0.4pt}}\end{center}
        }
    \else
        \renewcommand{\maketitle}{
            \noindent{\Large\textbf{\@title}}\\
            {\@course}\hfill{Name: \underline{\hspace{2in}}}\\
            \rule{\textwidth}{0.4pt}
            
        }
    \fi
% If the assignment option is selected, then format the title this way:
\else
    \ifteacher
        \renewcommand{\maketitle}{
            \noindent{\Large \textbf{\@title}}\\
            \@course\hfill\@author\\    %author is required when using teacher mode
            \rule{\textwidth}{0.4pt}
        }
    \else
        \renewcommand{\maketitle}{
            \noindent{\Large\textbf{\@title}}\\
            \@course\hfill Name: \underline{\hspace{2in}}\\
            \rule{\textwidth}{0.4pt}
        }
\fi



\usepackage{amsmath,amstext}

\ifmargins
    \usepackage[margin=1in]{geometry}
\else
    \usepackage[margin=0.5in]{geometry}
\fi


\usepackage{amssymb}
\usepackage{tikz}

% Use the custom mathcommands package.
\usepackage{mathcommands}

\newif\ifinProblem\inProblemfalse

\newcounter{parts}
\long\def\part#1{\par\stepcounter{parts}\ifinProblem\leftskip = 40pt\else\leftskip=10pt\fi \alph{parts}. #1}
\newenvironment{problem}[1]{
    \leftskip=0pt\inProblemtrue\setcounter{parts}{0}\vspace{5pt}\par\textbf{#1}\ 
}{
    \inProblemfalse\setcounter{parts}{0}\vspace{5pt}\par
}

%% define the custom \axis command for tikzpicture environment
\newcommand{\axis}[4]{
\draw[thick, <->] (#1-0.25,0)--(#2+0.25,0);
\draw[thick,<->] (0,#3-0.25)--(0,#4+0.25);
\foreach \r in {0,...,#1} {
    \draw[thin] (\r,-.1)--(\r,.1);
}
\foreach \r in {0,...,#2} {
    \draw[thin] (\r,-0.1)--(\r,.1);
}
\foreach \r in {0,...,#3} {
    \draw[thin] (-.1,\r)--(.1,\r);
}
\foreach \r in {0,...,#4} {
    \draw[thin] (-.1,\r)--(.1,\r);
}


}



\endinput
