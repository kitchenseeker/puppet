# Author: Gian Luca Fiasco
# email gifasco88@gmail.com

define macro-useradd ( $name, $uid, $groups, $sshkey, $pass ) {

  user { $title:
    shell       =>  '/bin/bash',
    home        =>  "/home/${title}",
    comment     =>  $name,
    uid         =>  $uid,
    gid         =>  $uid,
    managehome  =>  "true",
    groups      =>  $groups,
    password    =>  $pass,
  }

  group { $title:
     gid => $uid,
  }

  file { "/home/${title}":
    ensure      =>  directory,
    owner       =>  $title,
    group       =>  $title,
    mode        =>  0750,
    require     =>  [ User[$title], Group[$title] ],
  }


  ssh_authorized_key { "default-ssh-key-for-${title}":
    user   => $title,
    ensure => present,
    type   => "ssh-rsa",
    key    => "$sshkey",
    name   => $title,
  }

}

