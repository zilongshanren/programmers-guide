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
chapters=('blank' 'index' '1' '2' '3' '4' '5' '6' '7' '8' '9' '10' '11' '12' '13' '14' 'A' 'B'
'C' 'D' 'E' 'F' 'G' 'H' 'I')

### Turn on globbing (BASH 4 required)
shopt -s globstar

### We need to move the appropriate sized images to directory each chapter
### is looking for.
echo "building the html version with mkdocs..."
echo "output is in site/..."
echo "copying resources to docs..."
mkdir -p docs
mkdir -p print
rsync -a chapters/*-web* docs/
#rsync -a chapters/*-print* print/

### Pre-process the markdown files
### for the web = -DWEB
### without -DWEB = print
### Do every chapter, just in case images get added we dont have to modify script
echo "pre-processing chapters for the web..."
for i in ${chapters[@]}; do
  gpp -H -DWEB chapters/${i}.md -o docs/${i}.md
  gpp -H chapters/${i}.md -o print/${i}.md
done

### Now we can use MKDocs to build the static content
echo "MKDocs Build..."
mkdocs build

### build the ePub and PDF versions
echo "building the ePUB and PDF versions..."
cp solarized-light.css main.css style.css _layout.html5 print/.

for i in ${chapters[@]}; do
  pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o print/${i}.html print/${i}.md
done

#mv print/title.html print/intro.html #Silly this is because of a misnamed file I should fix.

echo "building the epub version..."
cd print/
pandoc -S --epub-stylesheet=style.css -o ProgrammersGuide.epub \
index.html \
blank.html \
1.html \
blank.html \
2.html \
blank.html \
3.html \
blank.html \
4.html \
blank.html \
5.html \
blank.html \
6.html \
blank.html \
7.html \
blank.html \
8.html \
blank.html \
9.html \
#blank.html \
#10.html \
blank.html \
11.html \
blank.html \
12.html \
blank.html \
13.html \
blank.html \
14.html \
blank.html \
A.html \
blank.html \
B.html \
blank.html \
C.html \
blank.html \
D.html \
blank.html \
E.html \
blank.html \
F.html \
blank.html \
G.html \
blank.html \
H.html \
blank.html \
I.html \
blank.html

### Building the PDF version
echo "building the PDF version..."
pandoc -s -o ProgrammersGuide.pdf ProgrammersGuide.epub
cd ..
cp print/ProgrammersGuide.pdf print/ProgrammersGuide.epub site/.
