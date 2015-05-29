TMPL = pandoc_custom/templates/revealjs.template
CSL = pandoc_custom/csl/elsevier-harvard.csl

# output files, file stem
FILES = intro.slides.html intro.pdf var_es.slides.html var_es.pdf func_rand_var.slides.html func_rand_var.pdf
OUTDIR = output

# speficy default target
CURRENT_TARGET = $(OUTDIR)/func_rand_var
current: $(CURRENT_TARGET).slides.html

reveal: $(CURRENT_TARGET).slides.html
pdf: $(CURRENT_TARGET).pdf

# target to build all formats for current target
all: reveal pdf

# target to build all files
OUT := $(addprefix $(OUTDIR)/,$(FILES))
everything: $(OUT)

debug: $(CURRENT_TARGET).tex

###################
## func_rand_var ##
###################

$(OUTDIR)/func_rand_var.slides.html: src/func_rand_var.md Makefile refs.bib
	pandoc --template=$(TMPL) \
	--slide-level=3 --toc --toc-depth=1 \
	--filter pandoc_custom/filters/adaptHeaders.hs \
	--filter pandoc_custom/filters/amsmath.hs \
	-V slideNumber=true \
	-V transition=none \
	--include-in-header=pandoc_custom/css/reveal_left_strong.css \
	-s -V revealjs-url=../reveal.js -t revealjs -f markdown \
	--filter pandoc-citeproc --csl=$(CSL) \
	--bibliography=refs.bib \
	-o $@ $<

$(OUTDIR)/func_rand_var.pdf: src/func_rand_var.md Makefile refs.bib
	pandoc -s -t beamer -f markdown \
	--slide-level=3 \
	-V theme=CambridgeUS -V colortheme=dolphin \
	--mathjax \
	--filter pandoc_custom/filters/skip_pause.hs \
	--filter pandoc-citeproc --csl=pandoc_custom/csl/elsevier-harvard.csl \
	--bibliography=refs.bib \
	-o $@ $<

###################
## var_es slides ##
###################

$(OUTDIR)/var_es.slides.html: src/var_es.md Makefile refs.bib
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

$(OUTDIR)/var_es.pdf: src/var_es.md Makefile refs.bib
	pandoc -s -t beamer -f markdown \
	--slide-level=3 \
	-V theme=CambridgeUS -V colortheme=dolphin \
	--mathjax \
	--filter pandoc_custom/filters/skip_pause.hs \
	--filter pandoc-citeproc --csl=pandoc_custom/csl/elsevier-harvard.csl \
	--bibliography=refs.bib \
	-o $@ $<

# -V theme=Frankfurt -V colortheme=default \

$(OUTDIR)/var_es.tex: src/var_es.md Makefile refs.bib
	pandoc -s -t beamer -f markdown \
	-V theme=CambridgeUS -V colortheme=dolphin \
	--mathjax \
	--filter pandoc_custom/filters/skip_pause.hs \
	--filter pandoc-citeproc --csl=pandoc_custom/csl/elsevier-harvard.csl \
	--bibliography=refs.bib \
	-o $@ $<

##################
## intro slides ##
##################

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

# -V theme=Frankfurt -V colortheme=default \

$(OUTDIR)/intro.tex: src/intro.md Makefile refs.bib
	pandoc -s -t beamer -f markdown \
	-V theme=CambridgeUS -V colortheme=dolphin \
	--mathjax \
	--filter pandoc_custom/filters/amsmath.hs \
	--filter pandoc_custom/filters/skip_pause.hs \
	--filter pandoc-citeproc --csl=pandoc_custom/csl/elsevier-harvard.csl \
	--bibliography=refs.bib \
	-o $@ $<

publish: $(OUT) Makefile refs.bib
	git checkout gh-pages
	git checkout master output/intro.slides.html
	git commit -m "slides updated"
	git push origin gh-pages
	git checkout master

# TODO: push files to ftp server

clean:
	rm -f $(OUTDIR)/*.slides.html \
	rm -f $(OUTDIR)/*.pdf

again:
	make clean
	make
