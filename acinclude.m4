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


# AC_BBFW_INIT()
# -----------------------------------
AC_DEFUN([AC_BBFW_INIT],[dnl

   # display options
   withval=""
   AC_ARG_WITH(
      init,
      [AS_HELP_STRING([--with-init=type], [init system type of slackware, systemd, or init.d [default=auto]])],
      [ WINIT=$withval ],
      [ WINIT=$withval ]
   )
   enableval=""
   AC_ARG_ENABLE(
      init,
      [AS_HELP_STRING([--disable-init], [install init scripts [default=auto]])],
      [ EINIT=$enableval ],
      [ EINIT=$enableval ]
   )

   # used specified init system
   ENABLE_INIT=auto
   if test "x${EINIT}" == "xno";then
      ENABLE_INIT=no
   elif test "x${WINIT}" == "xinit.d";then
      ENABLE_INIT=init.d
      ENABLE_INITD=yes
   elif test "x${WINIT}" == "xslackware";then
      ENABLE_INIT=slackware
      ENABLE_SLACKWARE=yes
   elif test "x${WINIT}" == "xsystemd";then
      ENABLE_INIT=systemd
      ENABLE_SYSTEMD=yes
   elif test ""x${WINIT}" != "xno" && test ""x${WINIT}" != "xyes" && test "x${WINIT}" != "x";then
      AC_MSG_ERROR([unknown init system, must be slackware, systemd, or init.d.])
   fi

   # auto detects init system
   if test "${ENABLE_INIT}" == "auto";then
      if test -f /etc/slackware-version;then
         ENABLE_INIT=slackware
         ENABLE_SLACKWARE=yes
      elif test -d "/etc/systemd/system/";then
         ENABLE_INIT=systemd
         ENABLE_SYSTEMD=yes
      elif test -d "/etc/init.d/";then
         ENABLE_INIT=init.d
         ENABLE_INITD=yes
      elif test "x${EINIT}" == "xyes";then
         AC_MSG_ERROR([unable to determine init system type])
      else
         ENABLE_INIT=no
      fi
   fi

   AM_CONDITIONAL([ENABLE_SLACKWARE], [test "x${ENABLE_SLACKWARE}" == "xyes"])
   AM_CONDITIONAL([ENABLE_INITD],     [test "x${ENABLE_INITD}"     == "xyes"])
   AM_CONDITIONAL([ENABLE_SYSTEMD],   [test "x${ENABLE_SYSTEMD}"   == "xyes"])
])dnl


# end of m4 file
