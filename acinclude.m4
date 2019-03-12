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
#   acinclude.m4 - custom m4 macros used by configure.ac
#


# AC_BBFW_EXAMPLES()
# -----------------------------------
AC_DEFUN([AC_BBFW_EXAMPLES],[dnl

   # display options
   enableval=""
   AC_ARG_ENABLE(
      examples,
      [AS_HELP_STRING([--disable-examples], [install example files [default=yes]])],
      [ EEXAMPLES=$enableval ],
      [ EEXAMPLES=$enableval ]
   )

   # sets options
   if test "x${EEXAMPLES}" == "xyes";then
      ENABLE_EXAMPLES=yes
   elif test "x${EEXAMPLES}" == "xno";then
      ENABLE_EXAMPLES=no
   else
      ENABLE_EXAMPLES=yes
   fi

   AM_CONDITIONAL([ENABLE_EXAMPLES], [test "${ENABLE_EXAMPLES}" == "yes"])
])dnl


# AC_BBFW_SLACKWARE()
# -----------------------------------
AC_DEFUN([AC_BBFW_SLACKWARE],[dnl

   # display options
   enableval=""
   AC_ARG_ENABLE(
      slackware,
      [AS_HELP_STRING([--enable-slackware], [enable Slackware specific scripts [default=auto]])],
      [ ESLACKWARE=$enableval ],
      [ ESLACKWARE=$enableval ]
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

   AM_CONDITIONAL([ENABLE_SLACKWARE], [test "${ENABLE_SLACKWARE}" == "yes"])
])dnl


# AC_BBFW_INITD()
# -----------------------------------
AC_DEFUN([AC_BBFW_INITD],[dnl

   # display options
   enableval=""
   AC_ARG_ENABLE(
      initd,
      [AS_HELP_STRING([--enable-initd], [enable init.d script [default=auto]])],
      [ EINITD=$enableval ],
      [ EINITD=$enableval ]
   )

   # sets options
   if test "x${EINITD}" == "xyes";then
      ENABLE_INITD=yes
   elif test "x${EINITD}" == "xno";then
      ENABLE_INITD=no
   else
      if test -d "/etc/init.d/";then
         ENABLE_INITD=yes
      else
         ENABLE_INITD=no
      fi
   fi

   AM_CONDITIONAL([ENABLE_INITD], [test "${ENABLE_INITD}" == "yes"])
])dnl


# AC_BBFW_SYSTEMD()
# -----------------------------------
AC_DEFUN([AC_BBFW_SYSTEMD],[dnl

   # display options
   enableval=""
   AC_ARG_ENABLE(
      systemd,
      [AS_HELP_STRING([--enable-systemd], [enable systemd unit file [default=auto]])],
      [ ESYSTEMD=$enableval ],
      [ ESYSTEMD=$enableval ]
   )

   # sets options
   if test "x${ESYSTEMD}" == "xyes";then
      ENABLE_SYSTEMD=yes
   elif test "x${ESYSTEMD}" == "xno";then
      ENABLE_SYSTEMD=no
   else
      if test -d "/etc/systemd/system/";then
         ENABLE_SYSTEMD=yes
      else
         ENABLE_SYSTEMD=no
      fi
   fi

   AM_CONDITIONAL([ENABLE_SYSTEMD], [test "${ENABLE_SYSTEMD}" == "yes"])
])dnl

# end of m4 file
