all: $(TARGETS)

clean:
	latexmk -CA
	rm -f *.pdf

%.pdf: %.tex .PHONY
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $<

.PHONY:
