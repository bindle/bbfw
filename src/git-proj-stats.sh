#!/bin/sh

TEMPLATE=/tmp/mail-template.$$
DATE=`date +%Y-%m-%d`

cat << EOF > ${TEMPLATE}
To: @EMAIL_ADDRESS@
From: "David M. Syzdek" <syzdek@bindlebinaries.com>
Subject: Bindle Binaries Projects Summary (${DATE})
Content-Type: text/html; charset=ISO-8859-1
EOF

echo "Updating local copies of repositories..."
for REPO in `ls /pub/src/`;do
   if test -d /pub/src/${REPO};then
      echo "Updating ${REPO}..."
      cd /pub/src/${REPO} && git pull > /dev/null 2>&1
   fi
done

echo '<div style="text-align:center"><h3>Summary of Changes</h3></div>'   >> ${TEMPLATE}
for REPO in `ls /pub/src/`;do
   if test -d /pub/src/${REPO};then
      echo "running git diff on ${REPO}..."
      cd /pub/src/${REPO}
      echo -n "<p>"                                              >> ${TEMPLATE}
      echo "<b>${REPO}</b>"                                 >> ${TEMPLATE}
      echo "<br/>Changes to pu branch in last  1 day:  "                       >> ${TEMPLATE}
      git diff --stat $(git rev-list -n1 --before="1 day ago" pu) |grep 'files changed, ' >> ${TEMPLATE}
      echo "<br/>Changes to pu branch in last  7 day:  "                       >> ${TEMPLATE}
      git diff --stat $(git rev-list -n1 --before="7 day ago" pu) |grep 'files changed, ' >> ${TEMPLATE}
      echo "<br/>Changes to pu branch in last 30 day:  "                       >> ${TEMPLATE}
      git diff --stat $(git rev-list -n1 --before="30 day ago" pu) |grep 'files changed, ' >> ${TEMPLATE}
      echo "</p>"                                                >> ${TEMPLATE}
   fi
done

echo "running ohcount..."
echo '<div style="text-align:center"><h3>Project Information</h3></div>'   >> ${TEMPLATE}
for REPO in `ls /pub/src/`;do
   if test -d /pub/src/${REPO};then
      echo "running ohcount on ${REPO}..."
      cd /pub/src/${REPO}
      echo -n "<p>"                                              >> ${TEMPLATE}
      echo "<b>${REPO}</b><br/>"                                 >> ${TEMPLATE}
      if test -f /pub/src/${REPO}/.git/description;then
         echo -n "<i>"                                           >> ${TEMPLATE}
         cat /pub/src/${REPO}/.git/description                   >> ${TEMPLATE}
         echo "</i>"                                              >> ${TEMPLATE}
      fi
      echo -n "<pre>"                                            >> ${TEMPLATE}
      /usr/local/bin/ohcount /pub/src/${REPO} |egrep -v '^$|Examining|Ohloh'    >> ${TEMPLATE}
      echo -n "</pre>"                                           >> ${TEMPLATE}
      echo "</p>"                                                >> ${TEMPLATE}
   fi
done

SENTRESULTS=NO
for ADDR in $@;do
   echo "sending results to ${ADDR}..."
   sed -e "s/[@]EMAIL_ADDRESS[@]/${ADDR}/g" ${TEMPLATE} |sendmail -t ${ADDR}
   SENTRESULTS=YES
done

if test "x${SENTRESULTS}" == "xNO";then
   cat ${TEMPLATE}
fi

rm -f ${TEMPLATE}
