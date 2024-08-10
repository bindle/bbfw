
Bindle Binaries Linux Firewall
===========================


Copyright (c) 2019,, 2024 David M. Syzdek <david@syzdek.net>.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

   * Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   * Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
   * Neither the name of David M. Syzdek nor the
     names of its contributors may be used to endorse or promote products
     derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL DAVID M. SYZDEK BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.


Non-technical Overview
======================

BBFW is the simple Linux firewall with a 1 to 1 feature match with iptables,
ip6tables, and ipsets.  As a bonus, the package also includes BBNET, BBFW's
little networking brother.  BBNET is the simple Linux networking script with
100% feature polarity with all versions of iproute2. Download now and also
receive `bbfw-log` and `bbnet-stats` absolutely free. Don't miss out and
download your copy today while supplies last.

Side affects may include consistent firewall rules accross your organization,
server clusters with matching firewalls, and the ability to test your firewall
rules on the CLI using the same syntax as your firewall configurations


Technical Overview
==================

This package contains the Bindle Binaries firewall script for Linux
systems. BBFW allows an administrator to create separate configuration
files for  global rules (i.e. oraganizational rules), cluster specific
rules, application speciic rules, and server specific firewall rules.
The configuration files containing the rules are loaded in a set order
which allows each level or rules to build upon the previous rules.


Configurations
==============

BBFW uses global configurations, application configurations, cluster
configurations, and local system configurations.  Each set of
configurations may contain iptables, ipsets, pre hook scripts, and post
hook scripts.  The iptables and ipset files are piped into `iptables-restore`
and `ipset restore` after unwrapping escaped new lines and stripping comments.

Files are processed in the following order:

      /etc/firewall.d/global.d/pre-hook   - centrally maintained pre-hook script
      /etc/firewall.d/apps.d/*/pre-hook   - app pre-hook script
      /etc/firewall.d/cluster.d/pre-hook  - cluster specific pre-hook script
      /etc/firewall.d/pre-hook            - host specific pre-hook script
      
      /etc/firewall.d/global.d/ipsets     - centrally maintained IP sets
      /etc/firewall.d/apps.d/*.ipsets     - app specific IP sets
      /etc/firewall.d/cluster.d/ipsets    - cluster specific IP sets
      /etc/firewall.d/ipsets              - host specific IP sets
      
      /etc/firewall.d/apps.d/*.rules4     - app specific IPv4 firewall rules
      /etc/firewall.d/apps.d/*.rules6     - app specific IPv6 firewall rules
      /etc/firewall.d/apps.d/*.rules      - app specific IPv4/IPv6 firewall rules
      
      /etc/firewall.d/rules4              - host specific IPv4 firewall rules
      /etc/firewall.d/rules6              - host specific IPv6 firewall rules
      /etc/firewall.d/rules               - host specific IPv4/IPv6 firewall rules
      
      /etc/firewall.d/cluster.d/rules4    - cluster specific IPv4 firewall rules
      /etc/firewall.d/cluster.d/rules6    - cluster specific IPv6 firewall rules
      /etc/firewall.d/cluster.d/rules     - cluster specific IPv4/IPv6 firewall rules
      
      /etc/firewall.d/global.d/rules4     - centrally maintained IPv4 rules
      /etc/firewall.d/global.d/rules6     - centrally maintained IPv6 rules
      /etc/firewall.d/global.d/rules      - centrally maintained IPv4/IPv6 rules
      
      /etc/firewall.d/global.d/post-hook  - centrally maintained post-hook script
      /etc/firewall.d/apps.d/*/post-hook  - app post-hook script
      /etc/firewall.d/cluster.d/post-hook - host specific post-hook script
      /etc/firewall.d/post-hook           - host specific post-hook script

Hook scripts are called as either `start` or `stop` as the first argument.
These scripts can be used to synchronize configurations from a server,
start/stop daemons, or generate dynamic rules.


Source Code
===========

The source code for this project is maintained using git.  The following
contains information to checkout the source code from the git repository.

Browse Source:

   * [https://github.com/bindle/bbfw](https://github.com/bindle/bbfw)

Git URLs:

   * [git@github.com:bindle/bbfw.git](git@github.com:bindle/bbfw.git)
   * [https://github.com/bindle/bbfw.git](https://github.com/bindle/bbfw.git)

Downloading Source:

      $ git clone https://github.com/bindle/bbfw.git

Preparing Source:

      $ cd bindleadmin
      $ ./build-aux/autogen.sh
      $ ./configure --prefix=/usr --sysconfdir=/etc
      $ make
      $ make install

Git Branches:

   - master - Current release of packages.
   - next   - changes staged for next release
   - pu     - proposed updates for next release
   - xx/yy+ - branch for testing new changes before merging to 'pu' branch

