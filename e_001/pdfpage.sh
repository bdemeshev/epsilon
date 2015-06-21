#!/bin/bash

# именно в этом порядке будут вычисляться номера страниц
# этот порядок должен совпадать с порядком в e_00n.pdf

# "статьи" без номеров страниц внизу
ARTICLESWN="cover
foreword"

# статьи с номерами страниц внизу
ARTICLES="functional-form
metrics-errors
knn
battle
fun
qa
qr-code
season
problems
stol_zakazov"

# не забудем откомпилировать статьи без номеров страниц:
for i in $ARTICLESWN
do
cd $i
pdflatex -interaction batchmode $i
pdflatex -interaction batchmode $i
biber $i
pdflatex -interaction batchmode $i
pdflatex -interaction batchmode $i
cd ../
done



CUM=3 # стартовая страница для новой статьи (сейчас для первой нумеруемой)
for i in $ARTICLES
do
cd $i
echo $CUM > 0pagecount.txt

# batchmode скрывает ошибки, поэтому компиляция может внешне пройти без ошибок, а pdf не обновлён
# если что, надо смотреть log файлы
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

# компилируем журнал целиком
pdflatex -interaction batchmode e_001.tex
