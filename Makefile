define install
	mkdir -p /usr/share/tuxquotes-sh /usr/share/licenses/tuxquotes-sh /usr/share/doc/tuxquotes-sh
	cp ./LICENSE /usr/share/licenses/tuxquotes-sh
	cp ./README.md /usr/share/doc/tuxquotes-sh
	cp ./btb.sh ./turkish.btb /usr/share/tuxquotes-sh
	install -m 755 tuxquotes.sh /usr/bin/tuxquotes
endef

define uninstall
	rm -rf /usr/share/tuxquotes-sh /usr/share/licenses/tuxquotes-sh /usr/share/doc/tuxquotes-sh /usr/bin/tuxquotes
endef

install:
	$(install)

uninstall:
	$(uninstall)

reinstall:
	$(uninstall)	
	$(install)
