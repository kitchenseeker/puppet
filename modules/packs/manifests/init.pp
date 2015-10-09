#modules/packs/manifests/init.pp
#list of packages nice to have installed on the system
# Author: Gian Luca Fiasco
# email gifasco88@gmail.com
class packs::utils {
    $enhancers = [ "git","screen","dnsutils", "vim", "curl", "lsof","sysstat"]
    $status = 'true'
    package { $enhancers: ensure => "installed" } ->


    file { "/etc/default/sysstat":
	ensure => file,
        owner  => "root",
        group  => "root",
        mode   => 0644,
	content => template('packs/systat.erb')
    }
  
    file { "/usr/local/bin":
                ensure   => present,
                mode     => 2775,
                group    => "staff",
                source   => "puppet:///modules/packs/usr/local/app",
                recurse  => true,
    }

}


class packs::dbi {
    $enhancers = ["mysql-server-5.5"]
    package { $enhancers: ensure => "installed" }
    ## myscripts

    file { "/usr/local/bin":
                ensure   => present,
                mode	 => 2775,
		group 	 => "staff",
		source   => "puppet:///modules/packs/usr/local/my",
                recurse  => true,
        }

}

class packs::app {
    $enhancers = ["php5", "php-pear","php5-mysql","php5-gd","php5-curl","zip","unzip","apache2"]
    package { $enhancers: ensure => "installed" }
}

