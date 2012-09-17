homework_1.pdf: homework_1.tex bin_tree1.eps
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make $<

clean:
	latexmk -CA
	rm -f *.pdf
