MG=25.4 
inkscape -z -D -e=pic.png -d 300 pic.svg
../../compile.py --pdf-options "-T $MG -B $MG -L $MG -R $MG cover proposal-cover.html toc --xsl-style-sheet toc-style.xsl" --style style-proposal.css --script proposal.js.html proposal.md output/proposal.pdf
