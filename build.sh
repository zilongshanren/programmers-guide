#!/bin/bash

echo "this script reqires: "
echo ""
echo "Pandoc: http://johnmacfarlane.net/pandoc/getting-started.html"
echo "A LaTex Distribution: http://www.tug.org/mactex/downloading.html"
echo "run: sudo tlmgr install ec ecc -- to install missing fonts"
echo ""
echo "To Do: Be able to insert a page break at the end of each chapter. right now it is continuous"

pandoc -markdown_github -s -o outline.pdf outline.md

pandoc -markdown_github -s -o manual.pdf title.md 1.md 2.md 3.md 4.md 5.md 6.md 7.md 8.md 9.md 10.md 11.md 12.md 13.md A.md B.md C.md D.md E.md F.md G.md H.md
