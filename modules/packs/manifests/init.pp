#modules/packs/manifests/init.pp
#list of packages nice to have installed on the system

class packs::utils {
    $enhancers = [ "mysql-client","screen","dnsutils", "vim", "nmap","curl", "lsof"]
    package { $enhancers: ensure => "installed" }
}


class packs::dbi {
    $enhancers = ["mysql-server-5.5"]
    package { $enhancers: ensure => "installed" }
}

class packs::app {
    $enhancers = ["php-curl","zip","unzip","apache2","wordpress"]
    package { $enhancers: ensure => "installed" }
}

