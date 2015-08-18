class wp::config {

        file { "/tmp/wp-config.php":
                ensure   => present,
                owner  => "www-data",
                group  => "www-data",
		mode     => 0644,
                source   => "puppet:///modules/wp/wp-config.php",
                recurse  => true,
        }
}

