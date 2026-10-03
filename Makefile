TEXBIN := /Library/TeX/texbin
export PATH := $(TEXBIN):$(PATH)

TL_PACKAGES := latexmk titlesec textpos isodate ragged2e footmisc substr

.PHONY: all watch clean setup

all:
	$(TEXBIN)/latexmk

watch:
	$(TEXBIN)/latexmk -pvc

clean:
	$(TEXBIN)/latexmk -C

setup:
	@[ -t 0 ] || { echo "make setup needs an interactive terminal so sudo can prompt for your password"; exit 1; }
	@command -v brew >/dev/null || { echo "Homebrew is required: https://brew.sh"; exit 1; }
	@[ -x $(TEXBIN)/xelatex ] || brew install --cask basictex
	sudo $(TEXBIN)/tlmgr update --self
	sudo $(TEXBIN)/tlmgr install $(TL_PACKAGES)
	@for p in $(TL_PACKAGES); do $(TEXBIN)/kpsewhich $$p.sty >/dev/null || [ -x $(TEXBIN)/$$p ] || { echo "$$p not found after install"; exit 1; }; done
	@echo "setup complete; run make to build"
