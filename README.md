Epsilon
=======

Эконометрический журнал «Эпсилон». Архив журнала находится на [http://bdemeshev.github.io/epsilon/](http://bdemeshev.github.io/epsilon/).

Как оформить статью
--------
* Советуем прочесть ["Стол заказов"](https://github.com/bdemeshev/epsilon/raw/master/e_001/stol_zakazov/stol_zakazov.pdf) и ["Образец статьи"](https://github.com/bdemeshev/epsilon/raw/master/template/eps-sample-final.pdf)
* Cоздать папку с `tex`-файлом статьи. Имя `tex`-файла _*обязательно должно совпадать*_ с именем папки. В качестве простенького образца статьи можно скачать любую статью из 1-го номера, например про [функциональную форму](https://github.com/bdemeshev/epsilon/raw/master/e_001/functional-form/functional-form.tex).
* Поместить в папку файлы [`epsilonj.sty`](https://github.com/bdemeshev/epsilon/raw/master/template/epsilonj.sty), [`0pdfpages.txt`](https://github.com/bdemeshev/epsilon/raw/master/e_001/functional-form/0pagecount.txt) (в этом файле находится число, с которого будет начинаться нумерация страниц в статье)
* Если честно, то правильно не класть файл `epsilonj.sty` в каждую папку со статьёй, а нужно проинсталлировать его раз и навсегда. Под linux/macos для этого достаточно запустить скрипт `install-class.sh`. Под windows: выполнить команду `kpsewhich -var-value=TEXMFHOME`. Получим адрес папки теха. Допустим это `C:/Users/username/texmf`. Создаём папку `C:/Users/username/texmf/tex/latex/epsilonj`. Копируем в неё `epsilonj.sty`. Еще под windows можно установить [Cygwin](http://www.cygwin.com/) для запуска `sh`-файлов.




Часто встречающиеся ошибки
--------------------------
* Весь мир давно перешёл на Юникод. Пора уже перестать писать <<такие кавычки>>, ибо babel давным-давно поддерживает «вот „это“». Если кто использует Линукс с DE Cinnamon, GNOME, Mate или KDE, в настройках клавиатуры достаточно включить третий уровень (на правый Alt, например) и расширенные типографические символы. Под Виндоус давным-давно есть «Типографская раскладка Ильи Бирмана» (must have). Пожалуйста, не исправляйте юникодовские «ёлки» на <<меньше-больше>>. Для перевода в `html` или компиляции `Rnw` «ёлки» подходят больше :) На маке «ёлки» можно вырастить с помощью option+\ и option+shift+\.
* Воспрещается бить строки жёсткими разрывами по 80 символов. Почему? Потому что тексты пропускаются через автоматический типограф, рассчитанный на то, что один абзац — это одна строка. Однобуквенные предлоги можно и нужно привязывать, однако если кто-то разобьёт текст на строки, то типограф подобные исключения не обработает. Один абзац — одна строка. Иные закосы под терминалы 80-х и прочую старину засчитаны *не будут*. Впрочем, допустимо разрывать отдельные предложение одного абзаца сразу после точки.




Да пребудет с нами сила! И печеньки!!!




Компиляция журнала в целом
---------------------------
* Для автоматической компиляции всего журнала достаточно запустить скрипт `pdfpages.sh`. Сообщения об ошибках на экран не выводятся, но их можно увидеть в `log`-файлах каждой статьи.
* Внутри папки с каждой статьёй лежит файл `0pdfpages.txt`, в нём написан номер страницы, с которой начинается данная статья в журнале. Если файла по каким-то причинам нет, и статья из-за этого не компилируется, его можно создать вручную.
* Все PNG-иллюстрации надо оптимизировать без потери качества
for i in *.png; do optipng -o7 -zm1-9 -preserve "$i" ; done
Если компьютер медленный, делаем
for i in *.png; do optipng -o7 -preserve "$i" ; done

Если какой-то PNG очень тяжёлый, перед этим ужимаем его с не заметной глазу (и тем более принтеру) потерей качества:
pngquant -s1 -f --ext .png --skip-if-larger --verbose *.png

Описание параметров выходного макета
-------------------------------------

* Ширина: 32pc
* Высота: 48pc

* Базовый размер шрифта: 10pt
* Размер заголовков таблиц и рисунков: \small
* Размер шрифта цитат: \footnotesize
* Размер шрифта таблиц: \footnotesize
* Номера уравнений: \footnotesize\textsf{#1}
* Листинги программ: \footnotesize

Изображения:
----------------
* Рекомендуемый размер растрового — до 1600×1200
* Чёрно-белые PNG — до 8 цветов



