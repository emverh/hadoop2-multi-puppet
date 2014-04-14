include rsa
include hadoop

group { "puppet":
  ensure => "present",
}

package { "java-1.6.0-openjdk-devel.i686":
  ensure => present,
}

package { "vim-enhanced" : 
  ensure => present,
}
