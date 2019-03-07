#
#   Bindle Binaries Linux Firewall
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
#   acinclude.m4 - custom m4 macros used by configure.ac
#

# AC_BINDLEADMIN_SLACKWARE()
# -----------------------------------
AC_DEFUN([AC_BINDLEADMIN_SLACKWARE],[dnl

   # display options
   enableval=""
   AC_ARG_ENABLE(
      slackware,
      [AS_HELP_STRING([--enable-slackware], [enable Slackware specific scripts [default=auto]])],
      [ ESLACKWARE=$enableval ],
      [ ESLACKWARE=$enableval ]
   )
   # display options
   enableval=""
   AC_ARG_ENABLE(
      slackpkg,
      [AS_HELP_STRING([--enable-slackpkg], [enable Slackware package scripts [default=no]])],
      [ ESLACKWAREPKG=$enableval ],
      [ ESLACKWAREPKG=$enableval ]
   )

   # determine slackware version
   SLACKWARE_VERSION="unknown"
   if test -f /etc/slackware-version;then
      SLACKWARE_VERSION=`cat /etc/slackware-version`
   fi
   KERNEL_NAME=`uname -s`

   # sets options
   if test "x${ESLACKWARE}" == "xyes";then
      ENABLE_SLACKWARE=yes
   elif test "x${ESLACKWARE}" == "xno";then
      ENABLE_SLACKWARE=no
   else
      if test "x${SLACKWARE_VERSION}" = "xunknown" || test "x${KERNEL_NAME}" != "xLinux";then
         ENABLE_SLACKWARE=no
      else
         ENABLE_SLACKWARE=yes
      fi
   fi

   # checks for slackware package
   if test "x${ESLACKWAREPKG}" = "xyes" && "x${ENABLE_SLACKWARE}" != "xyes";then
      AC_MSG_ERROR([--enable-slackpkg requires --enable-slackware to be specified or auto-detected.])
   fi
   ENABLE_SLACKPKG="no"
   if test "x${ESLACKWAREPKG}" = "xyes";then
      ENABLE_SLACKPKG="yes"
   fi

   AM_CONDITIONAL([ENABLE_SLACKWARE], [test "${ENABLE_SLACKWARE}" == "yes"])
   AM_CONDITIONAL([ENABLE_SLACKPKG],  [test "${ENABLE_SLACKPKG}"  == "yes"])
])dnl

# end of m4 file
