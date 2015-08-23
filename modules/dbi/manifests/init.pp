class dbi::active {

	class{ '::mysql::server':
		override_options => { 'mysqld' => {
    			'server-id'     => '1',
                        'log-bin'       => 'mysql-bin',
                        'datadir'       => '/var/lib/mysql',
                        'binlog-do-db'  => 'wordpress',
                        'bind-address'  => '0.0.0.0',
                        }
		}
	}
        mysql::db { 'wordpress':
                user     => 'wordpress',
                password => '-VQgsw2gDv', 
	        host     => '%',
                grant    => ['SELECT','INSERT','UPDATE','DELETE','CREATE','DROP','ALTER'],
        } ->

	mysql_user { 'replication@%':
    		ensure  => 'present',
		password_hash => mysql_password('gigi'),
	} ->
	mysql_grant { 'replication@%/wordpress.*':
		ensure     => 'present',
		options    => ['GRANT'],
		privileges => ['ALL'],
		table      => 'wordpress.*',
		user	   => 'replication@%',
	}
}



class dbi::standalone {

	include '::mysql::server'

	mysql::db { 'wordpress':
                user     => 'wordpress',
                password => '-VQgsw2gDv',
                host     => 'localhost',
        	grant    => ['SELECT','INSERT','UPDATE','DELETE','CREATE','DROP','ALTER'],
	}
}
