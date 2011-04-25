#
#   Bindle Binaries Tools
#   Copyright (C) 2011 Bindle Binaries <syzdek@bindlebinaries.com>.
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
#   m4/bindle.m4 - m4 macros used by configure.ac
#

# AC_DMS_BINDLE_PACKAGE_VERSION()
# -----------------------------------
AC_DEFUN([AC_BINDLE_GIT_PACKAGE_VERSION],[dnl

   if test -f ${srcdir}/.git/config;then
      GPV=$(${ac_aux_dir}/git-package-version.sh "${srcdir}")
      if test "x${GPV}" != "x";then
         AC_MSG_NOTICE([using git package version ${GPV}])
      fi
   elif test -f ${ac_aux_dir}/git-package-version;then
      GPV=$(cat ${ac_aux_dir}/git-package-version 2> /dev/null)
      if test "x${GPV}" != "x";then
         AC_MSG_NOTICE([using cached git package version ${GPV}])
      fi
   fi

   if test "x${GPV}" = "x";then
      AC_MSG_WARN([unable to determine package version from Git tags])
   else
      #
      # set internal variables
      GIT_PACKAGE_VERSION=${GPV}
      PACKAGE_VERSION=${GPV}
      VERSION=${GPV}
      #
      # set substitution variables
      AC_SUBST([GIT_PACKAGE_VERSION], [${GPV}])
      AC_SUBST([PACKAGE_VERSION], [${GPV}])
      AC_SUBST([VERSION], [${GPV}])
      #
      # set C/C++/Objc preprocessor macros
      AC_DEFINE_UNQUOTED([GIT_PACKAGE_VERSION], ["${GIT_PACKAGE_VERSION}"], [package version determined from git repository])
      AC_DEFINE_UNQUOTED([PACKAGE_VERSION], ["${GIT_PACKAGE_VERSION}"], [package version determined from git repository])
      AC_DEFINE_UNQUOTED([VERSION], ["${GIT_PACKAGE_VERSION}"], [package version determined from git repository])
   fi
])dnl


# AC_BINDLE_ENABLE_WARNINGS()
# ______________________________________________________________________________
AC_DEFUN([AC_BINDLE_ENABLE_WARNINGS],[dnl

   # prerequists
   AC_REQUIRE([AC_PROG_CC])

   # sets compiler
   if test "x${CC}" == "x";then
      ac_bindle_cc=cc;
   else
      ac_bindle_cc=${CC};
   fi

   # display options
   enableval=""
   AC_ARG_ENABLE(
      debug,
      [AS_HELP_STRING([--enable-debug], [enable debug messages in binaries])],
      [ EDEBUG=$enableval ],
      [ EDEBUG=$enableval ]
   )
   enableval=""
   AC_ARG_ENABLE(
      warnings,
      [AS_HELP_STRING([--disable-warnings], [disable compiler warnings])],
      [ EWARNINGS=$enableval ],
      [ EWARNINGS=$enableval ]
   )
   enableval=""
   AC_ARG_ENABLE(
      strictwarnings,
      [AS_HELP_STRING([--enable-strictwarnings], [disable compiler warnings])],
      [ ESTRICTWARNINGS=$enableval ],
      [ ESTRICTWARNINGS=$enableval ]
   )

   # sets options
   if test "x${ESTRICTWARNINGS}" != "xyes";then
      USE_STRICTWARNINGS=no
   else
      USE_STRICTWARNINGS=yes
   fi
   if test "x${EWARNINGS}" != "xno";then
      USE_WARNINGS=yes
   else
      USE_WARNINGS=no
      USE_STRICTWARNINGS=no
   fi
   if test "x${EDEBUG}" != "xno";then
      USE_DEBUG=yes
      AC_DEFINE_UNQUOTED(USE_DEBUG, 1, [Use debug messages])
   else
      USE_DEBUG=no
   fi

   # list of args
   ac_bindle_warnings_list=""
   if test "x${USE_WARNINGS}" == "xyes";then
      ac_bindle_warnings_list=" ${ac_bindle_warnings_list} -W"
      ac_bindle_warnings_list=" ${ac_bindle_warnings_list} -Wall"
      ac_bindle_warnings_list=" ${ac_bindle_warnings_list} -Werror"
   fi
   if test "x${USE_STRICTWARNINGS}" == "xyes";then
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -std=gnu99"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -pedantic"
      #ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wtraditional"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wpragma-once"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wextra-tokens"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wnewline-eof"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wsequence-point"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wdiv-by-zero"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wfloat-equal"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wdisabled-optimization"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wchar-subscripts"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wcomment"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wformat"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wimplicit"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wimplicit-function-declaration"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wmain"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wmissing-braces"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wparentheses"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wreturn-type"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wswitch"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wswitch-default"   # for some reason any call to memset() fails with this flag
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wtrigraphs"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wunused"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wunknown-pragmas"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wuninitialized"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wmultichar"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wundef"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wendif-labels"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wshadow"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wlarger-than-4096"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wpointer-arith"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wbad-function-cast"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wcast-qual"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wcast-align"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wwrite-strings"
      #ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wconversion" # prototypes with "short" or "unsigned short" cause warning: passing argument ?? with different width due to prototype
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wsign-compare"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Waggregate-return"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wshorten-64-to-32"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wstrict-prototypes"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wstrict-aliasing"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wmissing-prototypes"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wmissing-declarations"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wmissing-noreturn"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wmissing-format-attribute"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wredundant-decls"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wunreachable-code"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Winvalid-pch"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wpacked"
      #ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wpadded"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wnested-externs"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wenum-clash"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Winline"
      ac_bindle_warnings_list="${ac_bindle_warnings_list} -Wlong-long"
   fi

   # creates test source code
   AC_LANG_CONFTEST(
      [AC_LANG_PROGRAM(
         [[int main(void);]],
         [[return(0);]]
      )])

   # loops throough options
   CFLAGS_WARNINGS=""
   for ac_bindle_warning in ${ac_bindle_warnings_list};do
      AC_MSG_CHECKING(for gcc flag ${ac_bindle_warning})
      ${ac_bindle_cc} ${CFLAGS_WARNINGS} ${ac_bindle_warning} conftest.c -o conftest.o > /dev/null 2>&1
      if test "x$?" == "x0";then
         CFLAGS_WARNINGS="${CFLAGS_WARNINGS} ${ac_bindle_warning}"
         AC_MSG_RESULT(yes)
      else
         AC_MSG_RESULT(no)
      fi
   done

   # export variables
   AC_SUBST(CFLAGS_WARNINGS, "$CFLAGS_WARNINGS")
])dnl

# end of m4 file
