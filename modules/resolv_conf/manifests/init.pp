class resolv_conf {

        $DOMAIN = 'c.augmented-form-103908.internal.'
        $NAMESERVER= ['10.240.67.80','169.254.169.254','10.240.0.1']
        $PATH = 'c.augmented-form-103908.internal. 415183482875.google.internal. google.internal.'

        file { "/etc/resolv.conf":
                ensure => file,
                owner  => "root",
                group  => "root",
                mode   => 0644,
                content => template("resolv_conf/resolv.erb")
        }
}

