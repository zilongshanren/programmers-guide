#!/bin/bash

echo "this script reqires: "
echo ""
echo "Pandoc: http://johnmacfarlane.net/pandoc/getting-started.html"
echo "A LaTex Distribution: http://www.tug.org/mactex/downloading.html"
echo "run: sudo /usr/local/texlive/2014/bin/universal-darwin/tlmgr install ec ecc"
echo ""
echo "To Do: Be able to insert a page break at the end of each chapter. right now it is continuous"

# build the html version
echo "building the html version..."
mkdir -p _output/html

echo "building the html pages..."
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/intro.html title.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/1.html 1.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/2.html 2.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/3.html 3.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/4.html 4.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/5.html 5.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/6.html 6.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/7.html 7.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/8.html 8.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/9.html 9.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/10.html 10.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/11.html 11.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/12.html 12.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/13.html 13.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/14.html 14.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/A.html A.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/B.html B.md
pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/C.html C.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/D.html D.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/E.html E.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/F.html F.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/G.html G.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/H.html H.md
#pandoc -s --template "_layout" --css "solarized-light.css" -f markdown -t html5 -o _output/html/I.html I.md

echo "copying the html resources..."
cp main.html index.html solarized-light.css _output/html/.
cp -r ./2 _output/html/.
cp -r ./3 _output/html/.
cp -r ./4 _output/html/.
#cp -r ./5 _output/html/.
#cp -r ./6 _output/html/.
#cp -r ./7 _output/html/.
#cp -r ./9 _output/html/.
#cp -r ./10 _output/html/.
#cp -r ./12 _output/html/.
#cp -r ./14 _output/html/.
cp -r ./B _output/html/.
cp -r ./C _output/html/.
#cp -r ./D _output/html/.
#cp -r ./E _output/html/.
#cp -r ./F _output/html/.
#cp -r ./G _output/html/.
#cp -r ./H _output/html/.
#cp -r ./I _output/html/.

### Build the eBook version
echo "building the ebook version..."
pandoc -S --epub-stylesheet=style.css -o ProgrammersGuide.epub title.md 1.md 2.md 3.md

### Building the PDF version
echo "building the PDF version..."
pandoc -s -o ProgrammersGuide.pdf ProgrammersGuide.epub


### DOnt remove below here right yet.


#echo "building the table of contents..."
#rm -rf toc.txt
#
#./toc.pl _output/html/1.html > _output/html/1.txt
#./toc.pl _output/html/2.html > _output/html/2.txt
#./toc.pl _output/html/3.html > _output/html/3.txt
#./toc.pl _output/html/4.html > _output/html/4.txt
#./toc.pl _output/html/5.html > _output/html/5.txt
#./toc.pl _output/html/6.html > _output/html/6.txt
#./toc.pl _output/html/7.html > _output/html/7.txt
#./toc.pl _output/html/8.html > _output/html/8.txt
#./toc.pl _output/html/9.html > _output/html/9.txt
#./toc.pl _output/html/10.html > _output/html/10.txt
#./toc.pl _output/html/11.html > _output/html/11.txt
#./toc.pl _output/html/12.html > _output/html/12.txt
#./toc.pl _output/html/13.html > _output/html/13.txt
#./toc.pl _output/html/14.html > _output/html/14.txt

#cd _output/html/
#awk 'FNR==1{print ""}1' 1.txt 2.txt 3.txt 4.txt 5.txt 6.txt 7.txt 8.txt 9.txt 10.txt 11.txt 12.txt 13.txt 14.txt > toc.md
#rm -rf *.txt
#cd ../..
#pandoc -s --template "_layout" --css "style.css" -f markdown -t html5 -o _output/html/toc.html _output/html/toc.md



#pandoc --toc --toc-depth=3 -markdown_github -s -o _output/html/toc.html \
#_output/html/1.html \
#2.md \
#3.md \
#4.md

#pandoc "README.md" --toc --standalone --smart --toc --number-sections  --template default.html5 --output="_output/html/README.html"

#pandoc -markdown_github -s -o outline.pdf outline.md

#pandoc --chapters --latex-engine=xelatex -markdown_github -s -o manual.pdf title.md 1.md 2.md 3.md 4.md

#pandoc --toc --highlight-style=kate -V documentclass=book -markdown_github -s -o manual.html title.md 1.md 2.md 3.md 4.md

#pandoc --toc --highlight-style=kate -V documentclass=report -markdown_github -s -o manual.html title.md 1.md 2.md 3.md 4.md

#pandoc -markdown_github -s -o manual.pdf title.md 1.md 2.md 3.md 4.md


#pandoc -S --epub-stylesheet=style.css -o manual.epub title.md 1.md 2.md 3.md 4.md

#pandoc -s --template "_layout" --css "style.css" -f markdown -t html5 -o "$@" "$<" 1.md 2.md

#pandoc -s -o manual.pdf manual.epub
