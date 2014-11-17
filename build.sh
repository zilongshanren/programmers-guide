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
echo "building the html version..."
mkdir -p _output/html

echo "building the html pages..."
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/blank.html blank.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/intro.html title.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/1.html 1.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/2.html 2.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/3.html 3.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/4.html 4.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/5.html 5.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/6.html 6.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/7.html 7.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/8.html 8.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/9.html 9.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/10.html 10.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/11.html 11.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/12.html 12.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/13.html 13.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/14.html 14.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/A.html A.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/B.html B.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/C.html C.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/D.html D.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/E.html E.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/F.html F.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/G.html G.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/H.html H.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/I.html I.md

echo "copying the html resources..."
cp main.html index.html solarized-light.css main.css preview.png m_toc.html ch*.html _output/html/.

cp -r ./2 _output/html/.
cp -r ./3 _output/html/.
cp -r ./4 _output/html/.
#cp -r ./5 _output/html/.
#cp -r ./6 _output/html/.
#cp -r ./7 _output/html/.
cp -r ./9 _output/html/.
#cp -r ./10 _output/html/.
#cp -r ./12 _output/html/.
#cp -r ./14 _output/html/.
#cp -r ./A _output/html/. -- NO NEED THERE ARE NO FILES HERE YET
cp -r ./B _output/html/.
cp -r ./C _output/html/.
cp -r ./D _output/html/.
#cp -r ./E _output/html/. -- NO NEED THERE ARE NO FILES HERE YET SHARED WITH APPX D
cp -r ./F _output/html/.
cp -r ./G _output/html/.
cp -r ./H _output/html/.
cp -r ./I _output/html/.

### Build the eBook version
echo "building the ebook version..."
pandoc -S --epub-stylesheet=style.css -o _output/html/ProgrammersGuide.epub \
_output/html/intro.html \
_output/html/blank.html \
_output/html/1.html \
_output/html/blank.html \
_output/html/2.html \
_output/html/blank.html \
_output/html/3.html \
_output/html/blank.html \
_output/html/4.html \
_output/html/blank.html \
_output/html/5.html \
_output/html/blank.html \
_output/html/6.html \
_output/html/blank.html \
_output/html/7.html \
_output/html/blank.html \
_output/html/8.html \
_output/html/blank.html \
_output/html/9.html \
_output/html/blank.html \
_output/html/10.html \
_output/html/blank.html \
_output/html/11.html \
_output/html/blank.html \
_output/html/12.html \
_output/html/blank.html \
_output/html/13.html \
_output/html/blank.html \
_output/html/14.html \
_output/html/blank.html \
_output/html/A.html \
_output/html/blank.html \
_output/html/B.html \
_output/html/blank.html \
_output/html/C.html \
_output/html/blank.html \
_output/html/D.html \
_output/html/blank.html \
_output/html/E.html \
_output/html/blank.html \
_output/html/F.html \
_output/html/blank.html \
_output/html/G.html \
_output/html/blank.html \
_output/html/H.html \
_output/html/blank.html \
_output/html/I.html \
_output/html/blank.html

### Building the PDF version
echo "building the PDF version..."
pandoc -s -o _output/html/ProgrammersGuide.pdf _output/html/ProgrammersGuide.epub
