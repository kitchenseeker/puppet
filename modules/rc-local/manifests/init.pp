class rc-local {

	$commands=['puppet agent -t','echo gino']
	
	file { "/tmp/rc.local":
                ensure => file,
                owner  => "root",
                group  => "root",
                mode   => 0755,
		content => template("rc-local/rc.local.erb")
	}
}
