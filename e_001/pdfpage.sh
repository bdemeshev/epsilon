#!/bin/bash
ARTICLES="battle
knn
functional-form
fun
metrics-errors
qa
qr-code
season
problems
stol_zakazov"
CUM=3
for i in $ARTICLES
do
cd $i
echo $CUM > 0pagecount.txt
pdflatex -interaction batchmode $i
pdflatex -interaction batchmode  $i
biber $i
pdflatex -interaction batchmode $i
pdflatex -interaction batchmode $i
INCR=$(pdfinfo $i.pdf | grep Pages: | awk '{print $2}')
echo "Starting page of this document: $CUM"
echo "Pages in this document: $INCR"
CUM=$(($CUM + $INCR))
echo "Next document starts with page: $CUM"
cd ../
done
pdflatex -interaction batchmode e_001.tex
