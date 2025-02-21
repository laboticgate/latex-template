TARGET = main
LATEX = lualatex
BIBTEX = bibtex
SOURCES = $(shell find . -type f -name '*.tex' -o -name '*.sty')
IMAGES = $(shell find images/ -type f)

all: $(TARGET).pdf

$(TARGET).pdf: $(SOURCES) $(IMAGES)
	if [ $(shell bash -c "find . -type f -name '*.tex' -exec grep '^\s*\\bibliography' {} + > /dev/null; echo $$?") = 0 ]; then \
		$(LATEX) $(TARGET); \
		$(BIBTEX) $(TARGET); \
		$(LATEX) $(TARGET); \
		$(LATEX) $(TARGET); \
	else \
		$(LATEX) $(TARGET); \
		$(LATEX) $(TARGET); \
	fi

$(TARGET)_outline.pdf: $(TARGET).pdf
	gs -sDEVICE=pdfwrite -dNoOutputFonts -dQUIET -dNOPAUSE -dCompatibilityLevel=1.5 -o $@ $<

preview: $(TARGET).pdf
	pdfcrop --margins "-28.3464" $(TARGET).pdf main_nomargin.pdf

outline: $(TARGET)_outline.pdf

update: distclean
	make $(TARGET).pdf

view: $(TARGET).pdf
	evince $<

clean:
	rm -f $(TARGET).pdf $(TARGET)_outline.pdf $(TARGET)_preview.pdf

distclean: clean
	rm -f *.aux *.log *.bbl *.blg *.ilg *.ind *.ltjruby
