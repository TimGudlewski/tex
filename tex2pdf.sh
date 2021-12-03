#!/usr/bin/env bash
# Script for LaTeX compile process -- COPY to separate folder
# Run the following two commands:
# chmod u+x tex2pdf
# echo "export PATH=$PATH:(path to parent dir of COPY)" >> ~/.bashrc
# Restart terminal and now you should be able to generate a pdf with:
# tex2pdf (your file name without .tex)
[ -e $1.dvi ] && rm $1.dvi
[ -e $1.ps ] && rm $1.ps
if [ -e $1.pdf ]
then
  cp -rf $1.pdf $1.pdf.bak
  rm $1.pdf
fi
latexmk -dvi $1.tex
[ -e $1.dvi ] && dvips $1.dvi
[ -e $1.ps ] && ps2pdf -dALLOWPSTRANSPARENCY $1.ps
[ -e $1.pdf ] && xreader $1.pdf 2>&1 &
