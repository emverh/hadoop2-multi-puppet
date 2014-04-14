class rsa {

file { "/etc/ssh/ssh_config":
   source => "puppet:///modules/rsa/ssh_config",
   owner => "hadoop",
   group => "hadoop",
   mode => 600
}

file { "/home/hadoop/.ssh":
   ensure => "directory",
   owner => "hadoop",
   group => "hadoop",
   mode => 600,
}


file {
  "/home/hadoop/.ssh/id_rsa":
  source => "puppet:///modules/rsa/id_rsa",
  mode => 600,
  owner => hadoop,
  group => hadoop,
  require => Exec['apt-get update']
 }
 
file {
  "/home/hadoop/.ssh/id_rsa.pub":
  source => "puppet:///modules/rsa/id_rsa.pub",
  mode => 600,
  owner => hadoop,
  group => hadoop,
  require => Exec['apt-get update']
 }

ssh_authorized_key { "ssh_key":
    ensure => "present",
    key    => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDSmQKEUmUHeIWeNl6wac8mnH5iy36XVECoEp+VqVfANeX4SPQMFQb2f+LgBmodW+lKqvo8aO+kk1mWYSuU745n8g0xszAq46IlHtUxyz7pRJTO46Ut2PDEvAabSIP/CaGbKZ9+SajkE+fny/VUu10ke9KCiNw/8qW8OT52bqwq4lqKeyH4Rj7dhQfT20g8V9d0Sv9szozt+EVLjaF/2TcNGoHwGs8aSNQ0m/HtAUPZzrZO5J4LnVV+KwYnT0htyJGyHPwSuaMVbbNptIrblHMxLAsatZsQvi7wlJlPpH2zBTDjkODvRu3drbQ8UtQynYac8nTfVICp/TDa0JRHO4tf",
    type   => "ssh-rsa",
    user   => "hadoop",
    require => File['/home/hadoop/.ssh/id_rsa.pub']
}
 
}
