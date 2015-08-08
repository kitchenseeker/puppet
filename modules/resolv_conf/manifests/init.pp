class resolv_conf {

        $DOMAIN = 'c.itc308-1023.internal.'
        $NAMESERVER= ['10.240.69.241', '169.254.169.254','10.240.0.1']
        $PATH = 'c.itc308-1023.internal. 797169922257.google.internal. google.internal.'

        file { "/etc/resolv.conf":
                ensure => file,
                owner  => "root",
                group  => "root",
                mode   => 0644,
                content => template("resolv_conf/resolv.erb")
        }
}

