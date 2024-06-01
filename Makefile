#!/usr/bin/make -f

#SUBDIRS :=

all:
	# Desktop file
	(cd mamolinux/po/ && make)
	# Slideshow
	(cd mamolinux/branding/mamolinux/lang/ && make)
	# basicwallpaper
	(cd common/basicwallpaper && mkdir build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release && make)
	# MamoLinux OEM setup stuff
	(cd mamolinux && mkdir oemconfig && cd oemconfig && mkdir -p usr/bin && mkdir -p etc/calamares && mkdir -p usr/share/xsessions && mkdir -p usr/libexec && mkdir -p etc && mkdir -p usr/share/applications)
	(cp mamolinux/calamares-logs-helper mamolinux/oemconfig/usr/bin/)
	(cp mamolinux/oem/sddm.conf mamolinux/oemconfig/etc/)
	(cp mamolinux/oem/sudoers.oem mamolinux/oemconfig/etc/ && chmod 400 mamolinux/oemconfig/etc/sudoers.oem)
	(cp mamolinux/oem/calamares-oemfinish.sh mamolinux/oemconfig/usr/libexec/)
	(cp mamolinux/oem/calamares-finish-oem mamolinux/oemconfig/usr/bin/)
	(cp mamolinux/oem/calamares-finish-oem.desktop mamolinux/oemconfig/usr/share/applications/)
	(cp -r mamolinux/branding mamolinux/oemconfig/etc/calamares/)
	(cp -r mamolinux/oem/modules/ mamolinux/oemconfig/etc/calamares/)
	(cp mamolinux/oem/settings.conf mamolinux/oemconfig/etc/calamares/)
	(cp mamolinux/oem/mamolinux-oem-env/mamolinux-oem-environment.desktop mamolinux/oemconfig/usr/share/xsessions/)
	(cp mamolinux/oem/mamolinux-oem-env/start-mamolinux-oem-env mamolinux/oemconfig/usr/libexec/)
	(cp common/basicwallpaper/build/basicwallpaper mamolinux/oemconfig/usr/bin/)
	(fakeroot bash -c "chown -R root:root mamolinux/oemconfig && tar cvzf mamolinux/oemconfig.tar.gz mamolinux/oemconfig")
	# Get rid of the unnecessary files
	find mamolinux/ -type f -iname "*.in" | xargs rm -f
	find mamolinux/ -type f -iname "Makefile" | xargs rm -f
	rm -rf mamolinux/oemconfig
	rm -rf common/basicwallpaper/build
# vim:ts=4
