# site.pp
include packs::utils
include resolv_conf
include sudoerz

node 'default' {
}

node /mysql*/ {
   include packs::dbi
}

node /appnode*/ {
   include packs::app
}

#######ACCOUNTS MANAGEMENTS######
macro-useradd { "gianluka":
        pass    => "!",
        name    => "Cloud Architect",
        groups  => ["sudo","adm"],
        uid     => "1000",
        sshkey  => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDHZEIeOyj4HzMUuNQefFvMshct8UdWuLzZ8j5tFyeCjP/+GOsBNP4XAVaPny6RtgTLIae2zo+qq/r0pnQml7vIWJOJ68btMT219rf5oihqfLxldd/PQncPHPih/91f6TKA9w2pOoynti5Wvewi0VVp7zeGGDQGGNj1ZhahkqroX5LMutccZB59y+POuJlHUH7sgpJPTou/KAyTxUswLJSrsVaJp12HsRufSVXRfAc1/I2vBrBXhSnHnDZBf1YCIIboVpWu0y616dFUybfNvmEa7Rbi1tT3B63L9RCnQ3+1g5EZ2WXffN+zJ45mepTo+6l7/fpfFrbw0KOfFVVeDWlt"
       }



