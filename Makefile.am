#
#   Bindle Binaries Linux Firewall
#   Copyright (c) 2019 David M. Syzdek <david@syzdek.net>.
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
#      * Neither the name of David M. Syzdek nor the
#        names of its contributors may be used to endorse or promote products
#        derived from this software without specific prior written permission.
#
#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
#   IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
#   THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
#   PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL DAVID M. SYZDEK BE LIABLE FOR
#   ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#   DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
#   SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
#   CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
#   LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
#   OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
#   SUCH DAMAGE.
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


firewalldir				= $(sysconfdir)/firewall.d
firewallglobaldir			= $(firewalldir)/global.d
slackrcddir				= $(sysconfdir)/rc.d
initddir				= $(sysconfdir)/init.d
systemddir				= $(sysconfdir)/systemd/system


# automake targets
check_PROGRAMS				=
doc_DATA				= \
					  README.md \
					  ChangeLog.md \
					  COPYING \
					  NEWS.md \
					  AUTHORS \
					  doc/slack-desc
include_HEADERS				=
lib_LTLIBRARIES				=
man_MANS				=
info_TEXINFOS				=
noinst_LTLIBRARIES			=
noinst_HEADERS				=
noinst_PROGRAMS				=
bin_PROGRAMS				=
bin_SCRIPTS				=
pkgdata_DATA				=
sbin_SCRIPTS				= src/bbfw src/bbfw-log


# lists
AM_INSTALLCHECK_STD_OPTIONS_EXEMPT	=
BUILT_SOURCES				=
TESTS					=
XFAIL_TESTS				=
EXTRA_MANS				=
EXTRA_DIST				= \
					  ChangeLog.md \
					  NEWS.md \
					  README.md \
					  doc/slack-desc \
					  src/bbfw.in \
					  src/bbfw-log.in \
					  src/bbfw.conf-example.in \
					  src/firewall.d/global.d/rules-example \
					  src/firewall.d/global.d/rules4-example \
					  src/firewall.d/global.d/rules6-example \
					  src/firewall.d/global.d/ipsets-example \
					  src/firewall.d/ipsets-example \
					  src/firewall.d/rules-example \
					  src/firewall.d/rules4-example \
					  src/firewall.d/rules6-example \
					  src/rc.firewall.in \
					  src/firewall.bbfw.service.in
CLEANFILES				= \
					  $(builddir)/a.out   $(srcdir)/a.out \
					  $(builddir)/*/a.out $(srcdir)/*/a.out \
					  config.h.in~ $(srcdir)/config.h.in~ \
					  $(man_MANS) \
					  $(pkgdata_DATA) \
					  $(sysconf_DATA) \
					  $(bin_SCRIPTS) \
					  $(sbin_SCRIPTS) \
					  $(slackrcd_SCRIPTS) \
					  src/firewall.bbfw \
					  src/firewall.bbfw.service \
					  src/rc.firewall \
					  src/rc.firewall.new \
					  @PACKAGE_TARNAME@-*.tar.* \
					  @PACKAGE_TARNAME@-*.txz \
					  @PACKAGE_TARNAME@-*.zip
DISTCHECK_CONFIGURE_FLAGS		= \
					  --enable-strictwarnings \
					  --enable-initd \
					  --enable-slackware \
					  --enable-systemd


# conditional targets for slackware
if ENABLE_EXAMPLES
sysconf_DATA				= src/bbfw.conf-example
firewallglobal_DATA			= src/firewall.d/global.d/rules-example \
					  src/firewall.d/global.d/rules4-example \
					  src/firewall.d/global.d/rules6-example \
					  src/firewall.d/global.d/ipsets-example
firewall_DATA				= src/firewall.d/ipsets-example \
					  src/firewall.d/rules-example \
					  src/firewall.d/rules4-example \
					  src/firewall.d/rules6-example
endif
if ENABLE_SLACKWARE
slackrcd_SCRIPTS			=  src/rc.firewall.new
endif
if ENABLE_INITD
initd_SCRIPTS				=  src/firewall.bbfw
endif
if ENABLE_SYSTEMD
systemd_DATA				=  src/firewall.bbfw.service
endif


# Makefile includes
GIT_PACKAGE_VERSION_DIR=build-aux
SUBST_EXPRESSIONS =
include $(srcdir)/@bindletools_srcdir@/build-aux/makefile-autotools.am
include $(srcdir)/@bindletools_srcdir@/build-aux/makefile-subst.am
include $(srcdir)/@bindletools_srcdir@/build-aux/makefile-version.am


# custom targets
.PHONY:

src/bbfw: Makefile src/bbfw.in
	@$(do_subst_fn)

src/bbfw.conf-example: Makefile src/bbfw.conf-example.in
	@$(do_subst_dt)

src/bbfw-log: Makefile src/bbfw-log.in
	@$(do_subst_fn)

src/rc.firewall: Makefile src/rc.firewall.in
	@$(do_subst_fn)

src/rc.firewall.new: src/rc.firewall
	cp -p src/rc.firewall src/rc.firewall.new

src/firewall.bbfw: src/rc.firewall
	cp -p src/rc.firewall src/firewall.bbfw

src/firewall.bbfw.service: Makefile src/firewall.bbfw.service.in
	@$(do_subst_fn)


# local targets
install-exec-local:

install-data-local:

install-data-hook:

uninstall-local:

clean-local:

distclean-local:
	rm -fR $(srcdir)/autom4te.cache
	rm -fR slackware-pkg-build

# end of automake file
