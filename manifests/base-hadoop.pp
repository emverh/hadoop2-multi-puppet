include rsa
include hadoop

group { "puppet":
  ensure => "present",
}
  exec { 'yum update':
    command => '/usr/bin/yum update',
}

package { "java-1.6.0-openjdk-devel"
   ensure => present,
  require => Exec['yum update']
}

package { "vim" : 
   ensure => present,
   require => Exec['yum update']
}
