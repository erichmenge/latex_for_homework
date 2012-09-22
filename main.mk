all: $(TARGETS)

clean:
	latexmk -CA
	rm -f *.pdf

%.pdf: %.tex
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $<
