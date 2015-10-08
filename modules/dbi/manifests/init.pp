# Author: Gian Luca Fiasco
# email gifasco88@gmail.com

class dbi::cluster {

	$sql_id = regsubst($ipaddress_eth0, '^(\d+)\.(\d+)\.(\d+)\.(\d+)$', '\3\4')
	class{ '::mysql::server':
		override_options => { 'mysqld' => {
    			'server-id'     => $sql_id,
                        'log_bin'       => '/var/log/mysql/mysql-bin.log',
                        'datadir'       => '/var/lib/mysql',
                        'binlog_do_db'  => 'wordpress',
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
	mysql_grant { 'replication@%/*.*':
		ensure     => 'present',
		options    => ['GRANT'],
		privileges => ['REPLICATION SLAVE'],
		table      => '*.*',
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
