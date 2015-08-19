LATEX=pdflatex
CFLAGS=

BIBTEX=bibtex


TEX=example.tex

#all: $(TEX) bibliography
all: $(TEX)
	$(LATEX) $(CFLAGS) $(TEX)

bibliography:
	$(LATEX) $(CFLAGS) $(TEX)
	for file in bu*.aux; do \
		$(BIBTEX) $$file; \
	done;
