class hadoop {
 $hadoop_home = "/usr/local/hadoop"

group { "hadoop" :
  ensure => present,
  gid => 1000
}

user { "hadoop":
  ensure => present,
  gid => "hadoop",
  shell => "/bin/bash",
  managehome => true,
  require => Group["hadoop"]
}

exec { "download_hadoop" : 
  command => "/usr/bin/wget http://mirror.nexcess.net/apache/hadoop/common/hadoop-2.2.0/hadoop-2.2.0.tar.gz",
  cwd => "/tmp",
  require => User["hadoop"]
}

file {
  "/tmp/hadoop.tar.gz":
  mode => 640,
  owner => hadoop,
  group => hadoop,
  require => Exec["download_hadoop"]
}

exec { "unpack1_hadoop" :
  command => "/bin/tar zxf /tmp/hadoop.tar.gz -C /usr/local/",
  cwd => "/usr/local/hadoop"
}

exec { "unpack_hadoop" :
  command => "/bin/mv /usr/local/hadoop-2.2.0 /usr/local/hadoop",
  require => Exec["unpack1_hadoop"]
}

file {
  "${hadoop_home}/etc/hadoop/slaves":
  source => "puppet:///modules/hadoop/slaves",
  mode => 644,
  owner => hadoop,
  group => hadoop,
  require => Exec["unpack_hadoop"]
 }
 
file {
  "${hadoop_home}/etc/hadoop/masters":
  source => "puppet:///modules/hadoop/masters",
  mode => 644,
  owner => hadoop,
  group => hadoop,
  require => Exec["unpack_hadoop"]
 }

file {
  "${hadoop_home}/etc/hadoop/core-site.xml":
  source => "puppet:///modules/hadoop/core-site.xml",
  mode => 644,
  owner => hadoop,
  group => hadoop,
  require => Exec["unpack_hadoop"]
 }
 
file {
  "${hadoop_home}/etc/hadoop/mapred-site.xml":
  source => "puppet:///modules/hadoop/mapred-site.xml",
  mode => 644,
  owner => hadoop,
  group => hadoop,
  require => Exec["unpack_hadoop"]
 }
 
 file {
  "${hadoop_home}/etc/hadoop/hdfs-site.xml":
  source => "puppet:///modules/hadoop/hdfs-site.xml",
  mode => 644,
  owner => hadoop,
  group => hadoop,
  require => Exec["unpack_hadoop"]
 }
 
  file {
  "${hadoop_home}/etc/hadoop/hadoop-env.sh":
  source => "puppet:///modules/hadoop/hadoop-env.sh",
  mode => 644,
  owner => hadoop,
  group => hadoop,
  require => Exec["unpack_hadoop"]
 }
}
