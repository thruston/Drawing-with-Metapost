# Drawing-with-Metapost -- notes for contributing

Toby Thurston -- 23 Jun 2025

The `src` directory contains 
- the TeX source for the main document
- the style file used for marking up Metapost source code
- the Metapost source for each illustration used in the main document
- the corresponding PDF files created from each MP source file

## The design of the document

The general idea for the document is to include useful examples, which might
inspire readers to work out something for themselves, and which include some
discussion of the techniques involved.  The document is grouped into sections
focussing on a related set of techniques or types of drawing.  Some repetition
of minor details between sections is inevitable, but as far as possible refer
other sections instead of repeating.

The document class is "article" using a4paper and landscape mode.
Use only `\section` and `\subsection` -- if you must has a third level use
`\subsubsection*` to keep them out of the table of contents.  All headings should start 
on a new page.  Ideally each A4 landscape page should be complete in itself with one idea
and ideally one drawing, the source and a short discussion.  

Each MP source file should contain just one beginfig/endfig pair and produce a single PDF.

## Building the document

- build any new or updated Metapost source files with `lualatex` to create PDFs in the src directory.
  There are one or two files that still use `mpost`.  In these cases build with `mpost` and `epstopdf` and throw
  away the intermediate `.eps` file.

- build the main tex file with `lualatex -recorder Drawing-with-Metapost`

- run `python3 listex.py Drawing-with-Metapost --mp | xargs git add`  to read
  the `.fls` and `git add` all the files used

- `mv Drawing-with-Metapost.pdf ..`

- `git add ../Drawing-with-Metapost.pdf`

- edit the .tex file to comment-in the "don't compile this" loop at the top.

- `git add Drawing-with-Metapost.tex`

- git commit and push

## Making a release

- check for spelling etc -- check any URLs are still valid -- correct and build as needed

- tag the project locally `git tag -a v2.0 -m "Version 2.0"`

- push the tag upstream `git push origin tag v2.0`  (or whatever version you are at)

- make a release on github

- create an archive for CTAN

  `git archive HEAD --prefix=drawing-with-metapost/ --format=zip -o Drawing-with-Metapost-v2.0.zip`

  so that you create a zip with the right TLD for CTAN.

- upload the zip file on the CTAN submit page.

## Bugs, errors, issues, discussion.

If you find any errors, or have any suggestions for improvement, please raise an
issue or submit a pull request on Github.
