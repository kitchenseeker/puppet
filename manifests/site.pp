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
   include wp::stable
}

node /devappnode*/ {
   include packs::app
   #include wp::dev
}

#######ACCOUNTS MANAGEMENTS######
macro-useradd { "gianluka":
        pass    => "!",
        name    => "Cloud Architect",
        groups  => ["sudo","adm","www-data"],
        uid     => "2000",
        sshkey  => "AAAAB3NzaC1yc2EAAAABIwAAAQEAtcT2WmjM0D2u4gLwY3zG3QGnXrIRBO3/MyGuSStpnb54PSYxNU4Hh4xTYZWllXc/zBpxgG43uJqOPOZfRqeqXFETswlyixSkMELxaCBJeyZkqH3o3vXdSkSkw3CHl60PwqhXNwaraSPa8dpZMyWfiSw23fXqQ7cskCK5qGyB6KnvggK8aeOtknHSwqVTqI/ueSRSRhi0cnzheldNTRLbg8dzYUSVMNiMI5fPckYLgksKKkYi1imW5DrVxCr5+a+XqY2fEKdiTBLK6Vsyc7GpGxOEBg8QRUyzTlxRkZSmj4k8zj0pvVYI5wKK2shPDTboyU7SweFPl0q2wIeBEoLtHw=="
}

macro-useradd { "igorvolovichev":
        pass    => "!",
        name    => "Software Engineer",
        groups  => ["sudo","adm","www-data"],
        uid     => "2001",
        sshkey  => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDTUxPFVkURnhd04sVbiuU0B4zjDrTG0l3b6cGauJjJFvhN5rueCE0o5vZikg7RXOe/dqqhZB7H9JIYtVonVgoAJubTuWH6Anszdj5DZ+eTTUjn8gBh4xzrm5nVG4izgfOfWB3iBlQcFzJOnr/zTBSSzsSBhJnrPast0L0E2RDQ3/baDvmlEztAiy1mwV2pAbccdWjFkNuSWv5wEHYbILh/P5PS9HEupmarLCtqhJxaZgR3cLP2Mkzoc6bcxEtNh8g7rMsjTiymNrgrtKQsOgwePHpWFlmVQBA5prRYv8PwWZ8RHhm06ypLehQPO9NDNV4wREAZTdTcyc8QBtJNVOc7"

}


