#!/bin/bash

echo "this script reqires: "
echo ""
echo "Pandoc: http://johnmacfarlane.net/pandoc/getting-started.html"
echo "A LaTex Distribution: http://www.tug.org/mactex/downloading.html"
echo "run: sudo /usr/local/texlive/2014/bin/universal-darwin/tlmgr install ec ecc"
echo ""
echo "To Do: Be able to insert a page break at the end of each chapter. right now it is continuous"
echo ""

### build the html version
### We need to move the appropriate web sized images to directory each chapter
### is looking for.
echo "building the html version..."
mkdir -p _output/html

echo "bringing in web resources..."
cp -aR 2-web/ 2/
cp -aR 3-web/ 3/
cp -aR 4-web/ 4/
cp -aR 5-web/ 5/
cp -aR 6-web/ 6/
cp -aR 7-web/ 7/
#cp -aR 8-web/ 8/ -- NO NEED THERE ARE NO FILES HERE YET
cp -aR 9-web/ 9/
cp -aR 10-web/ 10/
#cp -aR 11-web/ 11/ -- NO NEED THERE ARE NO FILES HERE YET
cp -aR 12-web/ 12/
#cp -aR 13-web/ 13/ -- NO NEED THERE ARE NO FILES HERE YET
cp -aR 14-web/ 14/
#cp -aR A-web/ A/ -- NO NEED THERE ARE NO FILES HERE YET
cp -aR B-web/ B/
cp -aR C-web/ C/
cp -aR D-web/ D/
#cp -aR E-web/ E/ -- NO NEED THERE ARE NO FILES HERE YET SHARED WITH APPX D
cp -aR F-web/ F/
cp -aR G-web/ G/
cp -aR H-web/ H/
cp -aR I-web/ I/

echo "building the html pages..."
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/blank.html blank.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/intro.html title.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/1.html 1.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/2.html 2.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/3.html 3.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/4.html 4.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/5.html 5.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/6.html 6.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/7.html 7.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/8.html 8.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/9.html 9.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/10.html 10.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/11.html 11.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/12.html 12.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/13.html 13.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/14.html 14.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/A.html A.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/B.html B.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/C.html C.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/D.html D.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/E.html E.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/F.html F.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/G.html G.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/H.html H.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/I.html I.md

echo "copying the html resources to output directory..."
cp main.html index.html solarized-light.css main.css preview.png m_toc.html ch*.html _output/html/.

echo "moving web resources to the output directory..."
mv 2/ _output/html/2
mv 3/ _output/html/3
mv 4/ _output/html/4
mv 5/ _output/html/5
mv 6/ _output/html/6
mv 7/ _output/html/7
#mv 8/ _output/html/8 -- NO NEED THERE ARE NO FILES HERE YET
mv 9/ _output/html/9
mv 10/ _output/html/10
#mv 11/ _output/html/11 -- NO NEED THERE ARE NO FILES HERE YET
mv 12/ _output/html/12
#mv 13/ _output/html/13 -- NO NEED THERE ARE NO FILES HERE YET
mv 14/ _output/html/14
#mv A/ _output/html/A -- NO NEED THERE ARE NO FILES HERE YET
mv B/ _output/html/B
mv C/ _output/html/C
mv D/ _output/html/D
#mv E/ _output/html/E -- NO NEED THERE ARE NO FILES HERE YET SHARED WITH APPX D
mv F/ _output/html/F
mv G/ _output/html/G
mv H/ _output/html/H
mv I/ _output/html/I

### Build the eBook version
### When making the eBook andPDF the images for the web are to large.
### Lets temporarily rename the image directories for each chapter and use
### directories that have correctly sized images.
### Need to rename these when done so this process can be run again
echo "building the ebook version..."
mkdir -p _output/print

echo "bringing in print resources..."
cp -aR 2-print/ 2/
cp -aR 3-print/ 3/
cp -aR 4-print/ 4/
cp -aR 5-print/ 5/
cp -aR 6-print/ 6/
cp -aR 7-print/ 7/
#cp -aR 8-print/ 8/ -- NO NEED THERE ARE NO FILES HERE YET
cp -aR 9-print/ 9/
cp -aR 10-print/ 10/
#cp -aR 11-print/ 11/ -- NO NEED THERE ARE NO FILES HERE YET
cp -aR 12-print/ 12/
#cp -aR 13-print/ 13/  -- NO NEED THERE ARE NO FILES HERE YET
cp -aR 14-print/ 14/
#cp -aR A-print/ A/ -- NO NEED THERE ARE NO FILES HERE YET
cp -aR B-print/ B/
cp -aR C-print/ C/
cp -aR D-print/ D/
#cp -aR E-print/ E/ -- NO NEED THERE ARE NO FILES HERE YET SHARED WITH APPX D
cp -aR F-print/ F/
cp -aR G-print/ G/
cp -aR H-print/ H/
cp -aR I-print/ I/

echo "building the print pages..."
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/blank.html blank.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/intro.html title.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/1.html 1.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/2.html 2.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/3.html 3.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/4.html 4.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/5.html 5.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/6.html 6.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/7.html 7.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/8.html 8.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/9.html 9.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/10.html 10.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/11.html 11.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/12.html 12.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/13.html 13.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/14.html 14.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/A.html A.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/B.html B.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/C.html C.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/D.html D.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/E.html E.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/F.html F.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/G.html G.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/H.html H.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/print/I.html I.md

echo "copying the print resources to output directory..."
cp main.html index.html solarized-light.css main.css _output/print/.

echo "building the epub version..."
pandoc -S --epub-stylesheet=style.css -o _output/print/ProgrammersGuide.epub \
_output/print/intro.html \
_output/print/blank.html \
_output/print/1.html \
_output/print/blank.html \
_output/print/2.html \
_output/print/blank.html \
_output/print/3.html \
_output/print/blank.html \
_output/print/4.html \
_output/print/blank.html \
_output/print/5.html \
_output/print/blank.html \
_output/print/6.html \
_output/print/blank.html \
_output/print/7.html \
_output/print/blank.html \
_output/print/8.html \
_output/print/blank.html \
_output/print/9.html \
_output/print/blank.html \
_output/print/10.html \
_output/print/blank.html \
_output/print/11.html \
_output/print/blank.html \
_output/print/12.html \
_output/print/blank.html \
_output/print/13.html \
_output/print/blank.html \
_output/print/14.html \
_output/print/blank.html \
_output/print/A.html \
_output/print/blank.html \
_output/print/B.html \
_output/print/blank.html \
_output/print/C.html \
_output/print/blank.html \
_output/print/D.html \
_output/print/blank.html \
_output/print/E.html \
_output/print/blank.html \
_output/print/F.html \
_output/print/blank.html \
_output/print/G.html \
_output/print/blank.html \
_output/print/H.html \
_output/print/blank.html \
_output/print/I.html \
_output/print/blank.html

### Building the PDF version
echo "building the PDF version..."
pandoc -s -o _output/print/ProgrammersGuide.pdf _output/print/ProgrammersGuide.epub

echo "moving print resources to the output directory..."
mv 2/ _output/print/2
mv 3/ _output/print/3
mv 4/ _output/print/4
mv 5/ _output/print/5
mv 6/ _output/print/6
mv 7/ _output/print/7
#mv 8/ _output/print/8 -- NO NEED THERE ARE NO FILES HERE YET
mv 9/ _output/print/9
mv 10/ _output/print/10
#mv 11/ _output/print/11 -- NO NEED THERE ARE NO FILES HERE YET
mv 12/ _output/print/12
#mv 13/ _output/print/13 -- NO NEED THERE ARE NO FILES HERE YET
mv 14/ _output/print/14
#mv A/ _output/print/A -- NO NEED THERE ARE NO FILES HERE YET
mv B/ _output/print/B
mv C/ _output/print/C
mv D/ _output/print/D
#mv E/ _output/print/E -- NO NEED THERE ARE NO FILES HERE YET SHARED WITH APPX D
mv F/ _output/print/F
mv G/ _output/print/G
mv H/ _output/print/H
mv I/ _output/print/I

cp _output/print/ProgrammersGuide.epub _output/web/.
cp _output/print/ProgrammersGuide.pdf _output/web/.
