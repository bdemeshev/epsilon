#!/bin/sh

# узнаем, куда пользователю надо ставить стилевые файлы
WTEX=$(kpsewhich -var-value=TEXMFHOME)

# подложим ему туда кукушонка эпсилон
sudo mkdir $WTEX/tex/latex/epsilonj
sudo cp epsilonj.sty $WTEX/tex/latex/epsilonj/epsilonj.sty

# sudo mkdir /usr/local/texlive/2014/texmf-dist/tex/latex/epsilonj
# sudo cp epsilonj.sty /usr/local/texlive/2014/texmf-dist/tex/latex/epsilonj/epsilonj.sty

sudo texhash # в общем-то не нужен, так как мы кукушонка правильно кладём, но пусть будет

# создано по мотивам
# http://tex.stackexchange.com/questions/1137
