# Notes

Notes is a LaTeX class which makes it easier to manage both skeleton notes as
well as a filled out version of the course notes in a single document. In my
courses, I like to (when I have time) provide students with a typed copy of my
notes, since my handwritten notes neven contain all the information conveyed
during a class period. This class provides the means to manage both copies of
the lecture notes in a single place. 

## Installation

<details>
<summary>Linux</summary>
I prefer the following: 
```
mkdir ~/.settings
cd ~/.settings
git clone https://github.com/bradencarlson/lecturenotes.git
```
Then (with `sudo` or as root)
```
mkdir /usr/share/texmf/tex/latex/custom
cd /usr/share/texmf/tex/latex/custom
ln -s ./notes.cls ~/.settings/lecturenotes/notes.cls
ln -s ./mathcommands.sty ~/.settings/notes/mathcommands.cls
texhash
```
This allows the files to reside in your home directory while being available
anywhere on the machine. Now simple use 
```
\documentclass{notes}
```
in the preamble of a TeX file to use the class. 
</details>

## Help

Unfortunately, there is currently no documentation to see. I am working on it!
