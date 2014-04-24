#!/bin/sh

cd `dirname ${0}`               || exit 1
if test -x autogen.sh;then
   ./autogen.sh                 || exit 1
fi

mkdir -p slackware-pkg-build    || exit 1
cd slackware-pkg-build          || exit 1

../configure \
   --prefix=/usr \
   --sysconfdir=/etc \
   --libdir=/usr/lib64 \
   --enable-slackware \
   || exit 1

COPYFILE_DISABLE=1 make slackware-package   || exit 1
mv bindleadmin-*-noarch-1_bindle.txz ../    || exit 1
rm -Rf ../slackware-pkg-build               || exit 1

# end of script
