class hosts {
  file { "/etc/hosts":
    source => "puppet:///modules/hosts/$file_name",
    owner => root,
    group => root
  }
}
