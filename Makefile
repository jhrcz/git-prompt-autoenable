SPECVERSION = $(shell rpm -q --queryformat="%{version}\n" --specfile *.spec | head -n 1 | awk '{print $$1}' )
SPECNAME = $(shell rpm -q --queryformat="%{name}\n" --specfile *.spec | head -n 1 )

install:
	test -n "$(DESTDIR)"
	
	install -d "$(DESTDIR)"
	
	# examples not installed with make:
	# dot.git-prompt-dirs-excludes.list
	# dot.git-prompt-dirs.list
	# README.md
	
	install -d $(DESTDIR)/usr/bin
	install -t $(DESTDIR)/usr/bin git-prompt.sh
	install -t $(DESTDIR)/usr/bin git-prompt-cond.sh

	install -d $(DESTDIR)/etc/profile.d
	install -t $(DESTDIR)/etc git-prompt.conf
	install -t $(DESTDIR)/etc/profile.d git-prompt-profiled.sh
	
dist:
	rm $(SPECNAME)-$(SPECVERSION).tar.gz || true
	rm $(SPECNAME)-$(SPECVERSION).tar || true
	git archive --format=tar --prefix="$(SPECNAME)-$(SPECVERSION)/" -o $(SPECNAME)-$(SPECVERSION).tar HEAD
	gzip $(SPECNAME)-$(SPECVERSION).tar
