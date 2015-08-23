class dbi::standalone {

	include '::mysql::server'

	mysql::db { 'wordpress':
                user     => 'wordpress',
                password => '-VQgsw2gDv',
                host     => 'localhost',
        	grant    => ['SELECT','INSERT','UPDATE','DELETE','CREATE','DROP','ALTER'],
	}
}
