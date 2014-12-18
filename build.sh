#!/bin/bash

### State what we need for this script to run
echo "this script reqires: "
echo ""
echo "mkdocs: http://www.mkdocs.org/"
echo "gpp: brew install gpp"
echo "Bash 4.0: brew install bash"
echo "Pandoc: http://johnmacfarlane.net/pandoc/getting-started.html"
echo "A LaTex Distribution: http://www.tug.org/mactex/downloading.html"
echo "run: sudo /usr/local/texlive/2014/bin/universal-darwin/tlmgr install ec ecc"
echo ""
echo "To Do: Be able to insert a page break at the end of each chapter. right now it is continuous"
echo ""

### Define variables that we need for this script
### These are the chapters are are currently done. Add chapters here.
chapters=('blank' 'index' '1' '2' '3' '4' '5' '8' '9' '13' 'A' 'B'
'C' 'D' 'E' 'F' 'G' 'H' 'I')

### Turn on globbing (BASH 4 required)
shopt -s globstar

### We need to move the appropriate sized images to directory each chapter
### is looking for.
echo "building the html version with mkdocs..."
echo "output is in site/..."
echo "copying resources to respective directories..."
mkdir -p docs
mkdir -p print
rsync -a chapters/*-web* docs/
rsync -a chapters/*-print* print/
for i in ${chapters[@]}; do
  mv docs/${i}-web/ docs/${i}-img/
  mv print/${i}-print/ print/${i}-img/
done



### Pre-process the markdown files
### for the web = -DWEB
### without -DWEB = print
### Do every chapter, just in case images get added we dont have to modify script
#echo "pre-processing chapters for the web..."
#for i in ${chapters[@]}; do
#  gpp -H -DWEB chapters/${i}.md -o docs/${i}.md
#  gpp -H chapters/${i}.md -o print/${i}.md
#done

### Now we can use MKDocs to build the static content
echo "MKDocs Build..."
mkdocs build
