# targets that aren't filenames
.PHONY: all clean deploy build serve

all: build

BIBBLE = bibble

_includes/pubs_conference.html: bib/pubs_conference.bib bib/publications.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@

_includes/pubs_journal.html: bib/pubs_journal.bib bib/publications.tmpl
	$(BIBBLE) $+ > $@

_includes/pubs_patent.html: bib/pubs_patent.bib bib/publications.tmpl
	$(BIBBLE) $+ > $@

build: _includes/pubs_conference.html  _includes/pubs_journal.html  _includes/pubs_patent.html
	jekyll build

# you can configure these at the shell, e.g.:
# SERVE_PORT=5001 make serve
SERVE_HOST ?= 127.0.0.1
SERVE_PORT ?= 5000

serve: _includes/pubs_conference.html _includes/pubs_journal _includes/pubs_patent
	jekyll serve --port $(SERVE_PORT) --host $(SERVE_HOST)

clean:
	$(RM) -r _site _includes/pubs.html
	$(RM) -r _site _includes/pubs_conference.html
	$(RM) -r _site _includes/pubs_journal.html
	$(RM) -r _site _includes/pubs_patent.html

DEPLOY_HOST ?= www.dviz.cn/sbdkg
DEPLOY_PATH ?= 
RSYNC := rsync --compress --recursive --checksum --itemize-changes --delete -e ssh

deploy: clean build
	$(RSYNC) _site/ $(DEPLOY_HOST):$(DEPLOY_PATH)
