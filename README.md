# GCE PuppetMaster

<img style="-webkit-user-select: none;" src="https://cloud.githubusercontent.com/assets/13706023/9293131/7371c078-4461-11e5-891b-4ece09005a86.png" width="400" height="300">

__Team members__: _Igor, Akash, Luca_

##Modules

1. ***cron*** _configure the crontab per instance type_
2. ***dbi*** _configure mysql on mysql instances_
3. ***macro-useradd*** ***macro-useradd*** _add team accounts and ssh keys_
4. ***mysql*** _mysql dependency function_
5. ***packs*** _ensure the right packet ae instolled to the right server_
6. ***rc-local*** _ensure that if server gets restarted, puppet checks its config before anything else_
7. ***resolv_conf*** _configure /etc/resolv.conf_
8. ***staging***  _depedency module_
9. ***stdlib***   _stdlib depedency module_
10. ***sudoerz*** _makesure the /etc/sudoers is the same across the farm_
11. ***vcsrepo*** _git depedency module_
12. ***wp***	_configure apache and wordpress to host KS webapp_

## Custom Shell Scripts

* git-pup - _Run in a cronjob as backup for the puppet folder_
* config-agent.sh - _autoconfig pupet agents_
* clean-puppet.sh - _clean puppet from stale SSL certs_
