#How to start 

**vagrant up**

and you will create a cluster of 4 servers:

- HNName (master)
- HN2ndName (secondary)
- HNData1 (hndata1)
- HNData2 (hndata2)
- HNData3 (hndata3)

Puppet will setup Hadoop 2.2.0 for you so that you'll have 3 datanodes a namenode and a secondary.

**vagrant ssh master**

**sudo su - hadoop**

and execute:

**start-dfs.sh**

Once the script is over call: 

_jps_

you should see on master:

- _pid_ Jps
- _pid_ NameNode

and on secondary:

- _pid_ Jps
- _pid_ SecondaryNameNode

and on any of hndataX:

- _pid_ Jps
- _pid_ DataNode

**start nodemanager (on hnname)**
yarn-daemon.sh start nodemanager

If you edit the /etc/hosts file in your host machine as follows:

*hadoop vagrant*
- 192.168.2.10    hnname
- 192.168.2.11    hn2ndname
- 192.168.2.12    hndata1
- 192.168.2.13    hndata2
- 192.168.2.14    hndata3

you should be able to access via browser this urls:

1. http://HNName:50070
2. http://HN2ndName:50090

and see the list of the three datanodes here:

http://HNName:50070/dfsnodelist.jsp?whatNodes=LIVE

**Import data in hdfs**
hdfs dfs -put /path/to/your/file/file.ext hdfs://hnname:10001/your/directory

**How to kill a job**
mapred job -list
mapred job -kill <job_id>

#TO-DO:

**Configuration**

user.name is deprecated. Instead, use mapreduce.job.user.name
mapred.jar is deprecated. Instead, use mapreduce.job.jar
mapred.output.value.class is deprecated. Instead, use mapreduce.job.output.value.class
mapreduce.combine.class is deprecated. Instead, use mapreduce.job.combine.class
mapreduce.map.class is deprecated. Instead, use mapreduce.job.map.class
mapred.job.name is deprecated. Instead, use mapreduce.job.name
mapreduce.reduce.class is deprecated. Instead, use mapreduce.job.reduce.class
mapred.input.dir is deprecated. Instead, use mapreduce.input.fileinputformat.inputdir
mapred.output.dir is deprecated. Instead, use mapreduce.output.fileoutputformat.outputdir
mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
mapred.output.key.class is deprecated. Instead, use mapreduce.job.output.key.class
mapred.working.dir is deprecated. Instead, use mapreduce.job.working.dir
