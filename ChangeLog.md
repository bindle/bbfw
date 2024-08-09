
Bindle Binaries Linux Firewall
Copyright (c) 2019, 2021, 2022, 2024 David M. Syzdek <david@syzdek.net>.

0.27
  - bbfw: adding ability to disable a feature by setting the order to none
  - bbfw: adding initial support for file sync via git, rsync, or script
  - bbnet: removing options apps_dir, network_dir, and global_dir
  - bbnet: removing options net_up_script and net_down_script
  - bbnet: removing options pre_hook_script and post_hook_script
  - bbnet: adding ability to disable a feature by setting the order to none
  - bbnet: adding initial support for file sync via git, rsync, or script

0.26
  - bbfw: updating find_appfiles() for portability
  - bbfw: adding 'showconfig' option
  - bbfw: refactoring config check functions
  - bbfw: refactoring hook functions
  - bbfw: refactoring to follow structure of bbnet
  - bbnet: refactoring config_verify()

0.25
  - bbnet: changing default behavior to display usage
  - bbnet: removing broken action 'checkconfig'
  - bbnet: adding 'show' action
  - bbnet: updating output of 'showconfig'
  - bbnet: refactoring pre and post hook processing
  - bbnet: adding 'checkconfig' option
  - bbnet: adding initial support for app scripts

0.24
  - bbnet: fixing systemd unit file

0.23
  - bbnet: adding initial script

0.22
  - examples: fixing ipsets example

0.21
  - examples: updating example rules
  - openrc: updating dependencies

0.20
  - bbfw: added support for bbfw.conf to override defaults (syzdek)
  - bbfw: added 'checkconfig' action (syzdek)
  - conf: added ability to change order of file processing (syzdek)
  - conf: added ability to change firewall.d directory (syzdek)
  - init: added support for OpenRC (syzdek)
  - autotools: updated configure options for init systems (syzdek)
  - autotools: fixed dependency loop (syzdek)
  - autotools: removed unneeded compiler checks (syzdek)

0.19
  - bbfw: added ability to disable examples (syzdek)
  - bbfw: fixed app name when processing app specific files (syzdek)
  - bbfw: removed requirement for executable bit on app specific files (syzdek)
  - bbfw-log: added utility (syzdek)

0.18
  - forked rc.firewall to bbfw (syzdek)
  - added ability to group app specific rules in dedicated directory (syzdek)
  - renamed rules-pre/rules-post to pre-hook/post-hook (syzdek)
  - dropped support for LXC firewall rules (syzdek)

0.17
  - Moving global firewall rules to separate directory (syzdek)
  - Switch to tar.xz for source distributions (syzdek)

0.16
  - Re-ordering firewall rule processing (syzdek)
  - Adding 'dummy' and 'veth' interface types to rc.inet1 (syzdek)

0.15
  - Changing order firewall rules are applied (syzdek)

0.14
  - Adding support for cluster specific firewall rules (syzdek)
  - Improving multi-line processing in rc.firewall (syzdek)

0.13
  - Removing hardcoded binary paths in rc.firewall (syzdek)
  - Adding ability to have firewall rules stored in /etc/firewall.* (syzdek)

0.12
   - Adding support for line wraps in rc.firewall (syzdek)

0.11
   - Adding new link types to rc.inet1_local (syzdek)

0.10
   - Adding ability to specify application specific firewall rules (syzdek)
   - Adding ability to create IP sets with rc.firewall (syzdek)

0.9
   - Adding bility to purge custom chains with rc.firewall (syzdek)

0.8
   - Removing automatic loading of bonding module in rc.inet1 (syzdek)

0.7
   - Ensuring loopback is always enabled. (syzdek)

0.6
   - Adding explicity flush to lo interface in rc.inet1_local. (syzdek)
   - Updating version of bindletools used by autotools. (syzdek)
   - Updating configure and autogen scripts. (syzdek)

0.5
   - Updating logic in bash profile for determining hostname. (syzdek)

0.4
   - Updating example config files. (syzdek)

0.3
   - Fixing symlink handling in mkinitrd-all.sh (syzdek)

0.2
   - Updating git-proj-stats.sh. (syzdek)
   - Adding slack-pkg-audit.sh. (syzdek)
   - Adding rc.firewall (syzdek)
   - Adding rc.inet1_local (syzdek)
   - Adding bash profile bindle.sh (syzdek)
   - Misc fixes and updates to scripts. (syzdek)

0.1
   - starting project (syzdek)

