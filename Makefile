#!/usr/bin/make -f

#SUBDIRS :=

all:
	# Desktop file
	(cd mamolinux/po/ && make)
	# Slideshow
	(cd mamolinux/branding/mamolinux/lang/ && make)
	# Get rid of the unnecessary files
	find mamolinux/ -type f -iname "*.in" | xargs rm -f
	find mamolinux/ -type f -iname "Makefile" | xargs rm -f
# vim:ts=4
