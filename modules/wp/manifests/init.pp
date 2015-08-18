class wp::config {

        file { "/var/www/wp-config.php":
                ensure   => present,
                owner  => "www-data",
                group  => "www-data",
		mode     => 0644,
                source   => "puppet:///modules/wp/wp-config.php",
                recurse  => true,
        }
}

