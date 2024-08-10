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


# GNU make options
V					= 0


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
networkdir				= $(sysconfdir)/network.d
slackrcddir				= $(sysconfdir)/rc.d
initddir				= $(sysconfdir)/init.d
systemddir				= $(sysconfdir)/systemd/system


# automake targets
check_PROGRAMS				=
doc_DATA				= \
					  README.md \
					  ChangeLog.md \
					  TODO.md \
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
sbin_SCRIPTS				=
sysconf_DATA				=


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
					  TODO.md \
					  doc/slack-desc \
					  src/bbfw.in \
					  src/bbfw-log.in \
					  src/bbfw.conf-example.in \
					  src/bbnet.in \
					  src/bbnet-stats.in \
					  src/bbnet.conf-example.in \
					  src/firewall.d/global.d/rules-example \
					  src/firewall.d/global.d/rules4-example \
					  src/firewall.d/global.d/rules6-example \
					  src/firewall.d/global.d/ipsets-example \
					  src/firewall.d/ipsets-example \
					  src/firewall.d/rules-example \
					  src/firewall.d/rules4-example \
					  src/firewall.d/rules6-example \
					  src/init.d/bbfw.firewall.in \
					  src/init.d/bbfw.network.in \
					  src/network.d/net-down-example \
					  src/network.d/net-up-example \
					  src/openrc/bbfw.firewall.in \
					  src/openrc/bbfw.network.in \
					  src/slackware/rc.firewall.in \
					  src/slackware/rc.inet1.conf.in \
					  src/systemd/bbfw.firewall.service.in \
					  src/systemd/bbfw.network.service.in
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
					  src/init.d/bbfw.firewall \
					  src/init.d/bbfw.network \
					  src/slackware/rc.firewall \
					  src/slackware/rc.firewall.new \
					  src/systemd/bbfw.firewall.service \
					  src/systemd/bbfw.network.service \
					  src/openrc/bbfw.firewall \
					  src/openrc/bbfw.network \
					  @PACKAGE_TARNAME@-*.tar.* \
					  @PACKAGE_TARNAME@-*.txz \
					  @PACKAGE_TARNAME@-*.zip
DISTCHECK_CONFIGURE_FLAGS		= \
					  --enable-strictwarnings \
					  --enable-network \
					  --disable-init


# initializes directories
if ENABLE_SLACKWARE
slackrcd_SCRIPTS			=
endif
if ENABLE_OPENRC
initd_SCRIPTS				=
endif
if ENABLE_INITD
initd_SCRIPTS				=
endif
if ENABLE_SYSTEMD
systemd_DATA				=
endif


# conditional targets for bbfw
if ENABLE_FIREWALL
sbin_SCRIPTS				+= src/bbfw \
					   src/bbfw-log
if ENABLE_EXAMPLES
sysconf_DATA				+= src/bbfw.conf-example
firewallglobal_DATA			=  src/firewall.d/global.d/rules-example \
					   src/firewall.d/global.d/rules4-example \
					   src/firewall.d/global.d/rules6-example \
					   src/firewall.d/global.d/ipsets-example
firewall_DATA				=  src/firewall.d/ipsets-example \
					   src/firewall.d/rules-example \
					   src/firewall.d/rules4-example \
					   src/firewall.d/rules6-example
endif
if ENABLE_SLACKWARE
slackrcd_SCRIPTS			+= src/slackware/rc.firewall.new
endif
if ENABLE_OPENRC
initd_SCRIPTS				+= src/openrc/bbfw.firewall
endif
if ENABLE_INITD
initd_SCRIPTS				+= src/init.d/bbfw.firewall
endif
if ENABLE_SYSTEMD
systemd_DATA				+= src/systemd/bbfw.firewall.service
endif
endif


# conditional targets for bbnet
if ENABLE_NETWORK
sbin_SCRIPTS				+= src/bbnet
sbin_SCRIPTS				+= src/bbnet-stats
if ENABLE_EXAMPLES
sysconf_DATA				+= src/bbnet.conf-example
network_DATA				=  src/network.d/net-up-example \
					   src/network.d/net-down-example
endif
if ENABLE_SLACKWARE
slackrcd_SCRIPTS			+= src/slackware/rc.inet1.conf.new
endif
if ENABLE_OPENRC
initd_SCRIPTS				+= src/openrc/bbfw.network
endif
if ENABLE_INITD
initd_SCRIPTS				+= src/init.d/bbfw.network
endif
if ENABLE_SYSTEMD
systemd_DATA				+= src/systemd/bbfw.network.service
endif
endif


# Makefile includes
GIT_PACKAGE_VERSION_DIR=build-aux
SUBST_EXPRESSIONS =
include $(srcdir)/contrib/bindletools/build-aux/makefile-bindle.am
include $(srcdir)/contrib/bindletools/build-aux/makefile-autotools.am
include $(srcdir)/contrib/bindletools/build-aux/makefile-subst.am
include $(srcdir)/contrib/bindletools/build-aux/makefile-version.am


# custom targets
.PHONY:

src/bbfw: Makefile src/bbfw.in
	@$(do_subst_fn)

src/bbfw.conf-example: Makefile src/bbfw.conf-example.in
	@$(do_subst_dt)

src/bbfw-log: Makefile src/bbfw-log.in
	@$(do_subst_fn)

src/bbnet: Makefile src/bbnet.in
	@$(do_subst_fn)

src/bbnet-stats: Makefile src/bbnet-stats.in
	@$(do_subst_fn)

src/bbnet.conf-example: Makefile src/bbnet.conf-example.in
	@$(do_subst_dt)

src/slackware/rc.firewall: Makefile src/slackware/rc.firewall.in
	@$(do_copy_fn)

src/slackware/rc.firewall.new: src/slackware/rc.firewall
	@$(do_copy_fn)

src/slackware/rc.inet1.conf: Makefile src/slackware/rc.inet1.conf.in
	@$(do_copy_fn)

src/slackware/rc.inet1.conf.new: src/slackware/rc.inet1.conf
	@$(do_copy_fn)

src/init.d/bbfw.firewall: Makefile src/init.d/bbfw.firewall.in
	@$(do_subst_fn)

src/init.d/bbfw.network: Makefile src/init.d/bbfw.network.in
	@$(do_subst_fn)

src/systemd/bbfw.firewall.service: src/systemd/bbfw.firewall.service.in
	@$(do_subst_fn)

src/systemd/bbfw.network.service: src/systemd/bbfw.network.service.in
	@$(do_subst_fn)

src/openrc/bbfw.firewall: Makefile src/openrc/bbfw.firewall.in
	@$(do_subst_fn)

src/openrc/bbfw.network: Makefile src/openrc/bbfw.network.in
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
