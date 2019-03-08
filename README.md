
Bindle Binaries Linux Firewall
===========================


Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

   * Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   * Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
   * Neither the name of Bindle Binaries nor the
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


Contents
--------

   1. Overview
   2. Configurations
   3. Source Code
   4. Package Maintence Notes


Overview
========

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


Package Maintence Notes
=======================

This is a collection of notes for developers to use when maintaining this package.

New Release Checklist:

   - Switch to 'master' branch in Git repository.
   - Update version in configure.ac.
   - Update date and version in ChangeLog.
   - Commit configure.ac and ChangeLog changes to repository.
   - Create tag in git repository:

           $ git tag -s v${MAJOR}.${MINOR}

   - Push repository to publishing server:

           $ git push --tags origin master:master next:next pu:pu

Creating Source Distribution Archives:

      $ ./configure
      $ make update
      $ make distcheck
      $ make dist-bzip2


