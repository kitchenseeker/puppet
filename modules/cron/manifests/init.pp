class cron::app{
	file {'/tmp/example-cron': 
  		ensure  => file,
		owner   => root,
		group   => root,
  		mode    => 0644,
		source => "puppet:///modules/cron/cron.app" 
	}

	service { 'cron':
        	name      => cron,
        	ensure    => running,
	}
}
