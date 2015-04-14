TMPL = pandoc_custom/templates/revealjs.template
CSL = pandoc_custom/csl/elsevier-harvard.csl

# output files, file stem
FILES = intro.slides.html intro.pdf
OUTDIR = output
OUT := $(addprefix $(OUTDIR)/,$(FILES))

html: output/intro.slides.html

all: $(OUT)

debug: $(OUTDIR)/intro.tex

$(OUTDIR)/intro.slides.html: src/intro.md Makefile refs.bib
	pandoc --template=$(TMPL) \
	--slide-level=3 --toc --toc-depth=1 \
	--filter pandoc_custom/filters/adaptHeaders.hs \
	--filter pandoc_custom/filters/amsmath.hs \
	-V slideNumber=true \
	--include-in-header=pandoc_custom/css/reveal_left_strong.css \
	-s -V revealjs-url=../reveal.js -t revealjs -f markdown \
	--filter pandoc-citeproc --csl=$(CSL) \
	--bibliography=refs.bib \
	-o $@ $<

$(OUTDIR)/intro.pdf: src/intro.md Makefile refs.bib
	pandoc -s -t beamer -f markdown \
	--slide-level=3 \
	-V theme=CambridgeUS -V colortheme=dolphin \
	--mathjax \
	--filter pandoc_custom/filters/skip_pause.hs \
	--filter pandoc-citeproc --csl=pandoc_custom/csl/elsevier-harvard.csl \
	--bibliography=refs.bib \
	-o $@ $<

$(OUTDIR)/intro.tex: src/intro.md Makefile refs.bib
	pandoc -s -t beamer -f markdown \
	-V theme=CambridgeUS -V colortheme=dolphin \
	--mathjax \
	--filter pandoc_custom/filters/amsmath.hs \
	--filter pandoc_custom/filters/skip_pause.hs \
	--filter pandoc-citeproc --csl=pandoc_custom/csl/elsevier-harvard.csl \
	--bibliography=refs.bib \
	-o $@ $<



# publish: $(OUT) Makefile refs.bib
# 	git checkout gh-pages
# 	git checkout master output/content.slides.html
# 	git commit -m "slides updated"
# 	git push origin gh-pages
# 	git checkout master

# TODO: push files to ftp server

clean:
	rm -f $(OUTDIR)/*.slides.html

again:
	make clean
	make
