\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}


\newif\ifpresentation

\DeclareOption{presentation}{
	\presentationtrue
}
\DeclareOption{nopresentation}{
	\presentationfalse
}

\ExecuteOptions{presentation}
\ProcessOptions\relax

\LoadClass{article}
\usepackage[margin=1in]{geometry}
\usepackage{amsmath,amssymb,amstext}
\usepackage{mathcommands}

\long\def\phantom#1#2{\ifpresentation #1 \else #2 \fi}


\endinput
