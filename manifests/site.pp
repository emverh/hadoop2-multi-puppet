node hadoop-node {
  include rsa
  include hadoop
  include java
}

node 'HNName' inherits hadoop-node {
  $file_name = "master.cfg"
  include hosts
}

node 'HNData1' inherits hadoop-node {
  $file_name = "data1.cfg"
  include hosts
}

node 'HNData2' inherits hadoop-node {
  $file_name = "data2.cfg"
  include hosts
}

node 'HNData3' inherits hadoop-node {
  $file_name = "data3.cfg"
  include hosts
}

node 'HN2ndName' inherits hadoop-node {
  $file_name = "secodary.cfg"
  include hosts
}

