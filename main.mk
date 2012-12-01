all: $(TARGETS)

clean:
	latexmk -CA

%.pdf: %.tex .PHONY
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $<

.PHONY:
