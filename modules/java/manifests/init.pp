class java {

  $java_home="/usr/lib/jvm/java-1.6.0-openjdk"

  group { "puppet":
    ensure => "present",
  }

  package { "java-1.6.0-openjdk-devel.i686":
    ensure => present,
  }

  package { "vim-enhanced" :
    ensure => present,
  }
  
  exec { "set_environmet" : 
    command => "export JAVA_HOME=${java_home}",
  }
}
