class wp::stable {
	
	service { "apache2":
 	ensure  => "running",
    	enable  => "true",
	}	

	$DB_NAME = 'wordpress'
	$DB_USER = 'wordpress'
	$DB_U_PW = '-VQgsw2gDv'
	$HOST =	'mysql.kitchenseeker.com'

        vcsrepo { '/var/www':
                notify => service["apache2"],
                ensure   => present,
                excludes => "/var/www/wp-config.php",
		force   => "true",
                owner  => "www-data",
                group  => "www-data",
                provider => git,
                source   => 'https://github.com/kitchenseeker/www.git',
                revision => 'master',
        }


	file { "/var/www/wp-config.php":
        	notify => service["apache2"],
		ensure => file,
        	owner  => "www-data",
        	group  => "www-data",
        	mode   => 0644,
        	content => template("wp/wp-config_php.erb"),
        }
}

class wp::dev {

        service { "apache2":
        	ensure  => "running",
        	enable  => "true",
        }

	mysql::db { 'wordpress':
  		user     => 'wordpress',
  		password => '-VQgsw2gDv',
  		host     => 'localhost',
	} 

        $DB_NAME = 'wordpress'
        $DB_USER = 'wordpress'
        $DB_U_PW = '-VQgsw2gDv'
        $HOST = 'localhost'

        file { "/var/www/wp-config.php":
                notify => service["apache2"],
                ensure => file,
                owner  => "www-data",
                group  => "www-data",
                mode   => 0644,
                content => template("wp/wp-config_php.erb"),
        }

        vcsrepo { '/var/www':
                notify => service["apache2"],
                ensure   => present,
                owner  => "www-data",
                group  => "www-data",
                provider => git,
                source   => 'https://github.com/kitchenseeker/www.git',
                revision => 'development',
        }

}

