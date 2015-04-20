Programmers-Guide
=================

This is the Cocos2d-x programmers guide. It is licensed under the
`Creative Commons BY-SA` license. You can find it [here]( https://creativecommons.org/licenses/by-sa/4.0/)


## Directory layout

* `blank.md` - a blank page that is used when building print versions
* `build.sh` - BASH script that build web and print versions, deploys to server
* `chapters` - markdown content and images
* `mkdocs.yml` - MKDocs configuration
* `outline.md` - outline of what this guide covers (may be out of date)
* `README.md` - this file :-)
* `theme` - custom theme for web version

## What do you need to build for OS X?

* mkdocs: http://www.mkdocs.org/
* Bash 4.0: brew install bash
* Grip - https://github.com/joeyespo/grip
* PrinceXML - https://princexml.com

## How to run/test

* `cd <where you cloned this repo>/programmers-guide`
* run `mkdocs serve`

Any changes made while `mkdocs serve` is running are automatically rebuilt.

## How to build for deployment

* `cd <where you cloned this repo>/programmers-guide`
* run `build.sh`

Content is build in `docs` and deployed to `site`. This script also builds the
ePub and PDF versions as well as deploys out to staging (slackmoehrle.github.io)
and http://www.cocos2d-x.org/programmersguide

## How to add new content

* make sure to break lines at 80 columns.
* __chapters__ are actual book content while __appendix__ are installation and tools
* via a `pull request`. Please do not edit chapters directly.
* If you are creating a new chapter, please don't make it feel and sound like an
API Reference. This is a guide suited for new users (even though advanced users
will benefit too). Please tell a story about your content. We want to make this
engage the user. If in doubt: Read Chapter 2 and notice it feels like a chapter
in a book.
* Contact me via e-mail or on the forums to discuss what you want to add, edit, etc.
* `drafts` are chapters that are under construction or review and not yet approved
for the guide. (i.e new material). If you are adding to an existing chapter or
appendix, please do so via a pull request.
* each chapter has a markdown file and 3 image directories associated with it.
The image directories are `-web`, `-print` and `-img`.  `-web` is properly sized
images for displaying on the web. `print` is properly sized images for displaying
in the __epub__ and __pdf__. `-img` is were to put the original images (also
displayed when viewing from GitHub).
* the `build.sh` script does copying and renaming of directories during the build
process since the markdown files expects files at a specific path. Take a look.
* If a chapter does not have any images there is no need to create directories
for it.

## cleaning up the build script
* since I started this I know a lot more and want to clean up the build script
to be generic and sub functions instead of a single long script. I plan to do this
in the next version.
* we will be moving away from `pandoc` in favor of `PrinceXML` to build the PDF.
* we will be using `grip` to generate HTML output for the print versions.

## I found an error

* report via GitHub issues: https://github.com/chukong/programmers-guide/issues
* or clone and submit a pull request to fix it: https://github.com/chukong/programmers-guide/pulls

## Conventions used in this book

* `auto` is used for creating local variables.
* `using namespace cocos2d;` is used to shorten types.
* each chapter has a compilable source code sample to demonstrate concepts.


[Outline.md](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/outline.md) - outline of what the guide will cover (may be out of date)

Appendices
----------
 - [Appendix A - Prerequisites](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/A.md)
 - [Appendix B - Android with Terminal Installation and Setup](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/B.md)
 - [Appendix C - Android with Eclipse Installation and Setup](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/C.md)
 - [Appendix D - iOS Installation and Setup](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/D.md)
 - [Appendix E - Mac OSX Installation and Setup](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/E.md)
 - [Appendix F - Linux Installation and Setup](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/F.md)
 - [Appendix G - Win32 Installation and Setup](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/G.md)
 - [Appendix H - WP8 Installation and Setup](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/H.md)
 - [Appendix I - Command-Line Integration Project](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/I.md)

Chapters
--------
 - [Chapter 01 - About](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/1.md)
 - [Chapter 02 - Basic concepts and essentials](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/2.md)
 - [Chapter 03 - Sprites](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/3.md)
 - [Chapter 04 - Actions](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/4.md)
 - [Chapter 05 - Building and Transitioning Scenes](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/5.md)
 - [Chapter 06 - UI](https://github.com/chukong/programmers-guide/blob/v3.6/drafts/6.md)
 - [Chapter 07 - Other Node Types](https://github.com/chukong/programmers-guide/blob/v3.6/drafts/7.md)
 - [Chapter 08 - Event Dispatcher](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/8.md)
 - [Chapter 09 - 3D](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/9.md)
 - [Chapter 10 - Lua](https://github.com/chukong/programmers-guide/blob/v3.6/drafts/10.md)
 - [Chapter 11 - Services](https://github.com/chukong/programmers-guide/blob/v3.6/drafts/11.md)
 - [Chapter 12 - Physics](https://github.com/chukong/programmers-guide/blob/v3.6/drafts/12.md)
 - [Chapter 13 - Audio](https://github.com/chukong/programmers-guide/blob/v3.6/chapters/13.md)
 - [Chapter 14 - Advanced Topics](https://github.com/chukong/programmers-guide/blob/v3.6/drafts/14.md)
