# site.pp
include packs::utils
include resolv_conf
include sudoerz
include rc-local
node 'default' {
}

node /mysql*/ {
   include packs::dbi
}

node /appnode*/ {
   include packs::app
   include wp::config
}

#######ACCOUNTS MANAGEMENTS######
macro-useradd { "gianluka":
        pass    => "!",
        name    => "Cloud Architect",
        groups  => ["sudo","adm","www-data"],
        uid     => "2000",
        sshkey  => "AAAAB3NzaC1yc2EAAAABIwAAAQEAtcT2WmjM0D2u4gLwY3zG3QGnXrIRBO3/MyGuSStpnb54PSYxNU4Hh4xTYZWllXc/zBpxgG43uJqOPOZfRqeqXFETswlyixSkMELxaCBJeyZkqH3o3vXdSkSkw3CHl60PwqhXNwaraSPa8dpZMyWfiSw23fXqQ7cskCK5qGyB6KnvggK8aeOtknHSwqVTqI/ueSRSRhi0cnzheldNTRLbg8dzYUSVMNiMI5fPckYLgksKKkYi1imW5DrVxCr5+a+XqY2fEKdiTBLK6Vsyc7GpGxOEBg8QRUyzTlxRkZSmj4k8zj0pvVYI5wKK2shPDTboyU7SweFPl0q2wIeBEoLtHw=="
}



