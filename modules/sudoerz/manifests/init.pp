class sudoerz {

        file { "/etc/sudoers":
                ensure   => present,
                mode     => 0440,
                source   => "puppet:///modules/sudoerz/sudoers_file",
                recurse  => true,
        }
}
