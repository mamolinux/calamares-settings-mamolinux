#!/usr/bin/make -f

LANGUAGES := ar be ca da de el es et eu fr gl it ko no pl pt pt_BR ru zh-hans

all:
	for i in $(LANGUAGES); do \
		/usr/lib/qt5/bin/lrelease "calamares-mamolinux_$$i.ts"; \
		rm calamares-mamolinux_$$i.ts; \
	done

# vim:ts=4
