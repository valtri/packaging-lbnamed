
NAME=lbnamed

FILES=LBCD.pm\
      Makefile\
      README\
      lbnamed\
      lbnamed.config\
      lbnamed.rc\
      poller\
      slbcd

VERSION=2.3.2
RELEASE=$(NAME)-$(VERSION)

check: $(FILES)
	@echo "  The files are ready to go.  Now what?    Targets: clean, dist/release"

dist release: $(RELEASE).tar.gz

$(RELEASE).tar.gz: $(RELEASE).tar
	gzip -f $^

$(RELEASE).tar: $(FILES)
	ln -s . $(RELEASE)
	tar cf $@ $(addprefix $(RELEASE)/,$^)
	rm -f $(RELEASE)

clean:
	rm -f $(NAME)-*.tar.gz poller.config.* *.pid

