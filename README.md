md2pdf
======

A toolchain from markdown to pdf using wkhtmltopdf and others.

Though markdown to pdf convertors exist, most of them are either complex or not
flexible enough (to set styles or scripting). The tool convert markdown to
html first using markdown commandline tool (perl script) or python markdown
module, and then convert html to pdf using wkhtmltopdf. In the second phase js
and css can be added to customize resulting pdf files with the full strength
of html/css/js.

Why this tool:

1. Other markdown tools cannot satisfy my need (I cannot get all three
   examples right using other tools)
2. While manually perform markdown -> html -> pdf is possible, appending css and
   js manually is a boring and error prone work. 
3. Wkhtmltopdf is powerful but configuring it to work correctly is not that
   easy, especially for the toc part

## Dependencies

1. Wkhtmltopdf from [https://code.google.com/p/wkhtmltopdf/downloads/list](https://code.google.com/p/wkhtmltopdf/downloads/list)
2. Markdown (commandline, perl version) or python markdown module

## Examples

1. cover letter: usage with js and css
2. cv: usage with css to create column style documents (some rules are a little tricky)
3. proposal: (need inkscape to convert svg to png) complex example covering
   toc and svg images
