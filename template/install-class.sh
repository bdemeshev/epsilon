#!/bin/sh

# узнаем, куда пользователю надо ставить стилевые файлы
WTEX=$(kpsewhich -var-value=TEXMFHOME)

# подложим ему туда кукушонка эпсилон
sudo mkdir $WTEX/tex/latex/epsilonj
sudo cp epsilonj.sty $WTEX/tex/latex/epsilonj/epsilonj.sty

# sudo mkdir /usr/local/texlive/2014/texmf-dist/tex/latex/epsilonj
# sudo cp epsilonj.sty /usr/local/texlive/2014/texmf-dist/tex/latex/epsilonj/epsilonj.sty

sudo texhash # в общем-то не нужен, так как мы кукушонка правильно кладём, но пусть будет
# ~~~~А. В. — Нужен только в первый раз. Не знаю, эта штука только полсекунды ела. Можно и оставить.

# создано по мотивам
# http://tex.stackexchange.com/questions/1137

# ~~~~А. В., 08.07.2015
# Под Linux Debian Jessie с TeX Live 2015, установленным руками (через install-tl, а не через
# репо, этп вещь не работает вообще. Выдаёт неправильные директории:
# /home/fifis/texmf
# вместо корректной
# /usr/local/texlive/2014/texmf-dist/tex/latex/epsilonj
# Ладно, как в «Детях шпионов 2»: «Придётся рука-ами!»
