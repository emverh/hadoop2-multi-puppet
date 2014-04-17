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

_jps

you should see on master:

- <pid> Jps
- <pid> NameNode

and on secondary:

- <pid> Jps
- <pid> SecondaryNameNode

and on any of hndataX:

- <pid> Jps
- <pid> DataNode

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

http://192.168.2.10:50070/dfsnodelist.jsp?whatNodes=LIVE