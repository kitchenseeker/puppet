class wp::stable {
	
	file { "/root/.ssh/id_rsa":
                ensure => file,
                owner  => "root",
                group  => "root",
                mode   => 0600,
                source => "puppet:///modules/wp/id_rsa",
        }

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
        } ->


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
	## Github key
        file { "/root/.ssh/id_rsa":
                ensure => file,
                owner  => "root",
                group  => "root",
                mode   => 0600,
                source => "puppet:///modules/wp/id_rsa",
        }


        service { "apache2":
        	ensure  => "running",
        	enable  => "true",
        }

    		

        $DB_NAME = 'wordpress'
        $DB_USER = 'wordpress'
        $DB_U_PW = '-VQgsw2gDv'
        $HOST = 'localhost'

        vcsrepo { '/var/www':
                notify   => service["apache2"],
                ensure   => present,
                force    => 'true',
                owner    => "www-data",
                group    => "www-data",
                provider => git,
                source   => 'https://github.com/kitchenseeker/www.git',
                revision => 'development',
        } ->      
	
	file { "/var/www/wp-config.php":
                notify => service["apache2"],
                ensure => file,
                owner  => "www-data",
                group  => "www-data",
                mode   => 0644,
                content => template("wp/wp-config_php.erb"),
        } 
}
