class rc-local {

	$commands=['puppet agent -t']
	
	file { "/root/rc.local":
                ensure => file,
                owner  => "root",
                group  => "root",
                mode   => 0755,
		content => template("rc-local/rc.local.erb")
	}
}