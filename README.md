# Latex
A collection of latex classes and style files that are useful as a student to write homework assignments and exams.

Note that the assignment class imports the mathcommands package.

The way that I like to install these files into my texlive distribution is 
to save these files into a hidden directory in my home folder, then creating 
links to them in the directory
``` 
    /use/share/texmf/tex/latex/custom
```
where the `custom` folder is a folder that I created in the texmf tree 
for holding the links to my class files.  

After creating the links in this folder, we can run
```
    sudo texhash
```
and texlive will add these files to the list of known classes, making them 
visible everywhere on the system.  
