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
#   configure.in - automate compiling on a unix platform
#

AC_PREREQ([2.65])

AC_COPYRIGHT([Copyright (c) 2019, 2021, 2022, 2024 David M. Syzdek <david@syzdek.net>.])
AC_REVISION(0.1)
AC_INIT([Bindle Binaries Linux Firewall],[0.28],[david@syzdek.net],[bbfw])

AC_SUBST([RELEASE_MONTH],["August 2024"])

# directory locations
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_SRCDIR([build-aux/git-tar-name.txt])
AC_CONFIG_MACRO_DIR([m4])

# configures for automake
AM_INIT_AUTOMAKE(gnu std-options subdir-objects no-dist-gzip dist-xz foreign)

# Compilers
AC_PROG_INSTALL
AC_PROG_MAKE_SET

# binary locations
AC_PATH_PROG([SHELL],   sh bash,        [AC_MSG_ERROR([missing "sh"])], [$PATH])

# shell programs
AC_PROG_AWK
AC_PROG_EGREP
AC_PROG_FGREP
AC_PROG_LN_S

# initiates bindle tools macros
AC_BINDLE(contrib/bindletools)

# determine PACKAGE_VERSION via Git
AC_BINDLE_GIT_PACKAGE_VERSION([contrib/bindletools/build-aux/git-package-version.sh])


# custom configure options
AC_BBFW_EXAMPLES
AC_BBFW_FIREWALL
AC_BBFW_INIT
AC_BBFW_NETWORK


# Creates outputs
AC_CONFIG_FILES([Makefile])
AC_OUTPUT

# Show local config
AC_MSG_NOTICE([ ])
AC_MSG_NOTICE([   Bindle Binaries Linux Firewall $GIT_PACKAGE_VERSION ($GIT_PACKAGE_BUILD)])
AC_MSG_NOTICE([ ])
AC_MSG_NOTICE([   Install:])
AC_MSG_NOTICE([      Init Files:                ${ENABLE_INIT}])
AC_MSG_NOTICE([      Example Files:             ${ENABLE_EXAMPLES}])
AC_MSG_NOTICE([      Firewall Script:           ${ENABLE_FIREWALL}])
AC_MSG_NOTICE([      Network Script:            ${ENABLE_NETWORK}])
AC_MSG_NOTICE([ ])
AC_MSG_NOTICE([   Please send suggestions to:   $PACKAGE_BUGREPORT])
AC_MSG_NOTICE([ ])
AC_MSG_NOTICE([   run 'make all'])
AC_MSG_NOTICE([ ])

# end of configure.ac
