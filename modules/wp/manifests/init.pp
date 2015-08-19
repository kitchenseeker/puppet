class wp::stable {
	
	service { "apache2":
 	ensure  => "running",
    	enable  => "true",
	}	


	$DB_NAME = 'wordpress'
	$DB_USER = 'wordpress'
	$DB_U_PW = '-VQgsw2gDv'
	$HOST =	'mysql.kitchenseeker.com'

	file { "/var/www/wp-config.php":
        	notify => service["apache2"],
		ensure => file,
        	owner  => "www-data",
        	group  => "www-data",
        	mode   => 0644,
        	content => template("wp/wp-config_php.erb"),
        }

}

