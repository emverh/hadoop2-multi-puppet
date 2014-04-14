$puppetserver = "hadoop setup"

node "HNName" {
  file { "/etc/hosts":
    source => "puppet//modules/hosts/file/master.cfg",
    owner => root,
    group => root
  }
}

node "HNData1" {
  file { "/etc/hosts":
    source => "puppet//modules/hosts/file/data1.cfg",
    owner => root,
    group => root
  }
}

node "HNData2" {
  file { "/etc/hosts":
    source => "puppet//modules/hosts/file/data2.cfg",
    owner => root,
    group => root
  }
}

node "HNData3" {
  file { "/etc/hosts":
    source => "puppet//modules/hosts/file/data3.cfg",
    owner => root,
    group => root
  }
}

node "HN2ndName" {
  file { "/etc/hosts":
    source => "puppet//modules/hosts/file/secondary.cfg",
    owner => root,
    group => root
  }
}
