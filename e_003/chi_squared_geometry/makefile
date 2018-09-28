# makefile: Rmd -> tex -> pdf
# v 2.0
# .Rnw extension is automatically added
file_name = chi_squared_geometry

$(file_name).pdf: $(file_name).Rmd
	# protection against biber error
	# http://tex.stackexchange.com/questions/140814/
	rm -rf `biber --cache`
	# create pdf
	Rscript -e "rmarkdown::render('$(file_name).Rmd', 'pdf_document')"
