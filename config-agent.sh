#!/bin/bash

### puppet client config
echo "checking debian version"
debian=`cat /etc/debian_version`
case $debian in 
7.*) VERS="wheezy" ;; 
6.*) VERS='squeezy'; ;;
*) VERS='wheezy' ;;
 esac


cd ~; wget https://apt.puppetlabs.com/puppetlabs-release-${VERS}.deb
dpkg -i puppetlabs-release-${VERS}.deb
apt-get update
apt-get install puppet -y
sed -i 's/START=.*$/START=yes/g' /etc/default/puppet
sed -i '/templatedir.*$/d' /etc/puppet/puppet.conf
sed -i '/^\[master\].*/,$d' /etc/puppet/puppet.conf
echo  "[agent]
server = puppet" >> /etc/puppet/puppet.conf
service puppet start
sleep 90 && puppet agent -t --debug 2>&1 >> /root/post-log.log
