class wp:config {

        file { "/tmp/wp-config.php":
                ensure   => present,
                mode     => 0440,
                source   => "puppet:///modules/wp/wp-config.php",
                recurse  => true,
        }
}

