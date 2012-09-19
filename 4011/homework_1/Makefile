problems = homework_1.tex problem_1.tex problem_2.tex problem_3.tex problem_4.tex
problems := $(problems) problem_5.tex problem_6.tex problem_7.tex problem_8.tex

homework_1.pdf: $(problems)
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make $<

clean:
	latexmk -CA
	rm -f *.pdf
