#!/bin/bash

### Define variables that we need for this script
### These are the chapters are are currently done. Add chapters here.
allDocuments=('blank' 'index' '1' '2' '3' '4' '5' '6' '7' '8' '9' '10' '11'
'12' '13' '14' 'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I')
allChapters=('1' '2' '3' '4' '5' '6' '7' '8' '9' '10' '11'
'12' '13' '14' 'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I')
misc=('blank' 'index')
chaptersWithFolders=('2' '3' '4' '5' '6' '7' '9' '12' '14' 'B' 'C' 'D' 'F' 'G' 'H')
chaptersWithOutFolders=('1' '8' '10' '11' '13' 'A' 'E' 'I')

foundDirs=()

### Turn on globbing (BASH 4 required)
shopt -s globstar

hello() {
  echo "Building the Cocos2d-x Programmers Guide..."
  echo ""
  echo "You can pass in --help for help on how to use this script."
  echo ""
}

help() {
  ## State what we need for this script to run
  echo "this script reqires: "
  echo ""
  echo "mkdocs: http://www.mkdocs.org/"
  echo "Grip - https://github.com/joeyespo/grip"
  echo "PrinceXML - https://princexml.com"
  echo "Bash 4.0: brew install bash"
  echo ""
}

cleanUp() {
  echo "cleaning up cruft..."
  rm -rf print/
}

exitScript() {
  echo "exiting...."
  exit 0
}

deployToGitHub() {
  echo "deploying to GitHub Pages: ..."
  rsync -a site/ ../ChukongUSA.github.io/programmers-guide
  cd ../ChukongUSA.github.io/programmers-guide
  git add .
  git commit -m 'published automatically from script'
  git push
  cd ../../programmers-guide
}

buildHTML() {
  echo "building the html version with mkdocs..."
  echo "output is in site/..."
  echo "copying resources to respective directories..."
  rm -rf docs/
  mkdir -p docs
  mkdir -p print

  for i in ${chaptersWithFolders[@]}; do
    rsync -a chapters/${i}-web docs/
    rsync -a chapters/${i}-print print/
    mv docs/${i}-web docs/${i}-img
    mv print/${i}-print print/${i}-img
    cp chapters/${i}.md docs/${i}.md
    cp chapters/${i}.md print/${i}.md
  done

  for i in ${chaptersWithOutFolders[@]}; do
    cp chapters/${i}.md docs/${i}.md
    cp chapters/${i}.md print/${i}.md
  done

  for i in ${misc[@]}; do
    cp chapters/${i}.md docs/${i}.md
    cp chapters/${i}.md print/${i}.md
  done

  ## Now we can use MKDocs to build the static content
  echo "MKDocs Build..."
  rm -rf site/
  mkdocs build

  ## Now, lets copy the img folder to each chapter, we need to do this for theme
  ## path issues in the fact each directory is treated separately.
  ## We will get some errors here for chapters that dont yet exist
  for i in ${allChapters[@]}; do
    rsync -a theme/img site/${i}/
  done
}

buildPrint() {
  ## create HTML docs from the markdown files in the above array
  echo "building print version..."
  for i in "${allDocuments[@]}"; do
    grip --user <user> --pass <pass> --gfm print/${i}.md --export print/${i}.html

    ## insert the proper style that princeXML needs
    strToInsert='<style> @page { prince-shrink-to-fit: none } .repository-content {width: 900px ! important;} @page { margin: 40pt 10pt 40pt 10pt;}</style>'
    sed -i.bak "s#</head>#$strToInsert </head>#" print/${i}.html
  done

  echo "building the PDF..."
  cd print/
  prince index.html "${allChapters[@]/%/.html}" -o ../ProgrammersGuide.pdf
  cd ..
  cp ProgrammersGuide.pdf site/.
}

main() {
  ## display opening message to user
  hello

  ## See what parameters the user has supplied.
  if (( $# == 1 )); then
    if [[ "--help" =~ $1 ]]; then ## user asked for help
      help
      exit 0
    fi
  fi

  ## we don't need parameters to run the script so build the documentation
  buildHTML
  buildPrint
  deployToGitHub
  cleanUp
  exitScript
}

## run our script.
main $1
