#
#   Bindle Binaries Admin Tools
#   Copyright (C) 2014 Bindle Binaries <syzdek@bindlebinaries.com>.
#
#   @BINDLE_BINARIES_BSD_LICENSE_START@
#
#   Redistribution and use in source and binary forms, with or without
#   modification, are permitted provided that the following conditions are
#   met:
#
#      * Redistributions of source code must retain the above copyright
#        notice, this list of conditions and the following disclaimer.
#      * Redistributions in binary form must reproduce the above copyright
#        notice, this list of conditions and the following disclaimer in the
#        documentation and/or other materials provided with the distribution.
#      * Neither the name of Bindle Binaries nor the
#        names of its contributors may be used to endorse or promote products
#        derived from this software without specific prior written permission.
#
#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
#   IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
#   THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
#   PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL BINDLE BINARIES BE LIABLE FOR
#   ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#   DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
#   SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
#   CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
#   LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
#   OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
#   SUCH DAMAGE.
#
#   @BINDLE_BINARIES_BSD_LICENSE_END@
#
#   @configure_input@
#
#   Makefile.am - automate compiling on a unix platform
#

# Sub directories
SUBDIRS					=
DIST_SUBDIRS				=


# Global flags
AM_LIBS					=
AM_LDFLAGS				=
AM_CFLAGS				= -O2 $(CFLAGS_WARNINGS)
AM_CXXFLAGS				= -O2 @AM_CXXFLAGS@
AM_OBJCFLAGS				= -O2 @AM_OBJCFLAGS@
AM_CPPFLAGS				= -O2 -UPMARK -DHAVE_CONFIG_H=1 -I$(top_builddir)/include -I$(top_srcdir)/include -DSYSCONFDIR="\"$(sysconfdir)\""
ACLOCAL_AMFLAGS				= -I m4 -W all -W error
AM_MAKEINFOFLAGS                        = --no-split
DEFS					=


LXCDIR					?= /var/lib/lxc
slackrcddir				= $(sysconfdir)/rc.d
bashprofiledir				= $(sysconfdir)/profile.d


# automake targets
bashprofile_DATA			= src/bash/bindle.sh
check_PROGRAMS				=
doc_DATA				= README COPYING ChangeLog AUTHORS
include_HEADERS				=
lib_LTLIBRARIES				=
man_MANS				=
info_TEXINFOS				=
noinst_LTLIBRARIES			=
noinst_HEADERS				=
noinst_PROGRAMS				=
bin_PROGRAMS				=
bin_SCRIPTS				=
pkgdata_DATA				= src/misc/bindleadmin-script.profile
sbin_SCRIPTS				= src/misc/cronmail.sh


# lists
BUILT_SOURCES				=
TESTS					=
XFAIL_TESTS				=
EXTRA_MANS				=
EXTRA_DIST				= src/misc/bindleadmin-script.profile.in \
					  src/misc/cronmail.sh.in \
					  src/misc/git-proj-cleanup.sh.in \
					  src/misc/git-proj-stats.sh.in \
					  src/misc/pub-generate-readme.sh.in \
					  src/misc/pub-rsync-remotes.sh.in \
					  src/slack/rc.firewall.in \
					  src/slack/rc.firewall.policy-example \
					  src/slack/rc.firewall.policy4-example \
					  src/slack/rc.firewall.policy6-example \
					  src/slack/rc.firewall.rules-example \
					  src/slack/rc.firewall.rules4-example \
					  src/slack/rc.firewall.rules6-example \
					  src/slack/rc.inet1.conf.new \
					  src/slack/rc.inet1_local.in \
					  src/slack/rc.inet1_local_down-example \
					  src/slack/rc.inet1_local_up-example \
					  src/slack/slack-desc \
					  src/slack/slack-net-check.sh.in \
					  src/slack/slack-pkg-audit.sh.in \
					  src/slack/slack-sync-auth.sh.in \
					  src/slack/slack-update-mirrors.sh.in
CLEANFILES				= \
					  $(builddir)/a.out   $(srcdir)/a.out \
					  $(builddir)/*/a.out $(srcdir)/*/a.out \
					  config.h.in~ $(srcdir)/config.h.in~ \
					  $(man_MANS) \
					  $(pkgdata_DATA) \
					  $(bin_SCRIPTS) \
					  $(sbin_SCRIPTS) \
					  $(slackrcd_SCRIPTS) \
					  src/misc/cronmail.sh \
					  src/misc/git-proj-cleanup.sh \
					  src/misc/git-proj-stats.sh \
					  src/misc/pub-generate-readme.sh \
					  src/misc/pub-rsync-remotes.sh \
					  src/slack/rc.firewall \
					  src/slack/rc.inet1_local \
					  src/slack/slack-net-check.sh \
					  src/slack/slack-pkg-audit.sh \
					  src/slack/slack-sync-auth.sh \
					  src/slack/slack-update-mirrors.sh \
					  @PACKAGE_TARNAME@-*.tar.* \
					  @PACKAGE_TARNAME@-*.txz \
					  @PACKAGE_TARNAME@-*.zip
DISTCHECK_CONFIGURE_FLAGS		= --enable-strictwarnings --enable-slackware


# conditional targets
if ENABLE_SLACKWARE
sbin_SCRIPTS				+= src/slack/slack-net-check.sh \
					   src/slack/slack-pkg-audit.sh
slackrcd_SCRIPTS			=  src/slack/rc.firewall \
					   src/slack/rc.inet1_local
slackrcd_DATA				=  src/slack/rc.firewall.policy-example \
					   src/slack/rc.firewall.policy4-example \
					   src/slack/rc.firewall.policy6-example \
					   src/slack/rc.firewall.rules-example \
					   src/slack/rc.firewall.rules4-example \
					   src/slack/rc.firewall.rules6-example \
					   src/slack/rc.inet1.conf.new \
					   src/slack/rc.inet1_local_down-example \
					   src/slack/rc.inet1_local_up-example
endif

# Makefile includes
GIT_PACKAGE_VERSION_DIR=build-aux
SUBST_EXPRESSIONS =
include $(srcdir)/@bindletools_srcdir@/build-aux/makefile-autotools.am
include $(srcdir)/@bindletools_srcdir@/build-aux/makefile-subst.am
include $(srcdir)/@bindletools_srcdir@/build-aux/makefile-version.am


# custom targets
.PHONY: install-lxc slackware-package

src/misc/bindleadmin-script.profile: Makefile src/misc/bindleadmin-script.profile.in
	@$(do_subst_dt)

src/misc/cronmail.sh: Makefile src/misc/cronmail.sh.in
	@$(do_subst_fn)

src/misc/git-proj-cleanup.sh: Makefile src/misc/git-proj-cleanup.sh.in
	@$(do_subst_fn)

src/misc/git-proj-stats.sh: Makefile src/misc/git-proj-stats.sh.in
	@$(do_subst_fn)

src/misc/pub-generate-readme.sh: Makefile src/misc/pub-generate-readme.sh.in
	@$(do_subst_fn)

src/misc/pub-rsync-remotes.sh: Makefile src/misc/pub-rsync-remotes.sh.in
	@$(do_subst_fn)

src/slack/rc.firewall: Makefile src/slack/rc.firewall.in
	@$(do_subst_fn)

src/slack/rc.inet1_local: Makefile src/slack/rc.inet1_local.in
	@$(do_subst_fn)

src/slack/slack-pkg-audit.sh: Makefile src/slack/slack-pkg-audit.sh.in
	@$(do_subst_fn)

src/slack/slack-net-check.sh: Makefile src/slack/slack-net-check.sh.in
	@$(do_subst_fn)

src/slack/slack-sync-auth.sh: Makefile src/slack/slack-sync-auth.sh.in
	@$(do_subst_fn)

src/slack/slack-update-mirrors.sh: Makefile src/slack/slack-update-mirrors.sh.in
	@$(do_subst_fn)

install-lxc: install
	for LXC in `ls $(LXCDIR)`;do $(MAKE) DESTDIR=/var/lib/lxc/$${LXC}/rootfs install;done

if ENABLE_SLACKWARE
bindleadmin-$(PACKAGE_VERSION)-noarch-1_bindle.txz: $(SCRIPTS) $(PROGRAMS) $(DATA)
	sudo rm -Rf slackware-pkg-build
	$(abs_top_srcdir)/autogen.sh
	mkdir -p slackware-pkg-build/slackware-package/install
	cp $(abs_top_srcdir)/src/slack/slack-desc \
		slackware-pkg-build/slackware-package/install/slack-desc
	cd slackware-pkg-build && $(abs_top_srcdir)/configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libdir=/usr/lib64 \
		--enable-slackware
	cd slackware-pkg-build && $(MAKE) distcheck
	cd slackware-pkg-build && $(MAKE) DESTDIR=slackware-package install
	sudo chown -R 0:0 slackware-pkg-build/slackware-package
	cd slackware-pkg-build/slackware-package && sudo makepkg -l y -p -c n ../../$(@)
	sudo rm -Rf slackware-pkg-build

slackware-package: bindleadmin-$(PACKAGE_VERSION)-noarch-1_bindle.txz
endif

# local targets
install-exec-local:

install-data-local:

install-data-hook:
	test ! -f $(slackrcddir)/rc.firewall || chmod 755 $(slackrcddir)/rc.firewall
	test ! -f $(bashprofile)/bindle.sh   || chmod 755 $(bashprofile)/bindle.sh

uninstall-local:

clean-local:

distclean-local:
	rm -fR $(srcdir)/autom4te.cache
	rm -fR slackware-pkg-build

# end of automake file
