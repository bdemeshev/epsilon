Epsilon
=======

Эконометрический журнал «Эпсилон». Архив журнала находится на [http://bdemeshev.github.io/epsilon/](http://bdemeshev.github.io/epsilon/).

Заметки по редактированию журнала
--------
* Для начала можно прочесть ["Стол заказов"](https://github.com/bdemeshev/epsilon/raw/master/e_001/stol_zakazov/stol_zakazov_01.pdf) и ["Образец статьи"](https://github.com/bdemeshev/epsilon/raw/master/template/eps-sample-final.pdf)
* Перед компиляцией номеров журнала нужно скопировать стилевой файл `epsilonj.sty` в корректную папку. Под linux/macos для этого достаточно запустить скрипт `install-class.sh`. Под windows можно либо установить [Cygwin](http://www.cygwin.com/) для запуска `sh`-файлов, либо вручную: Выполнить команду `kpsewhich -var-value=TEXMFHOME`. Получим адрес папки теха. Допустим это `C:/Users/username/texmf`. Создаём папку `C:/Users/username/texmf/tex/latex/epsilonj`. Копируем в неё `epsilonj.sty`.
* Для автоматической компиляции всего журнала достаточно запустить скрипт `pdfpages.sh`. Сообщения об ошибках на экран не выводятся, но их можно увидеть в `log`-файлах каждой статьи.


Да пребудет с нами сила!






