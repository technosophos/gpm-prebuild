all:
	-@echo Targets: install

install:
	install -d /usr/local/bin
	install -m 0755 ./bin/gpm-prebuild /usr/local/bin

.PHONY: all install
