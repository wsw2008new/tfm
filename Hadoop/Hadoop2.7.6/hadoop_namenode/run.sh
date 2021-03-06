#!/bin/bash

# namedir=`echo $HDFS_CONF_dfs_namenode_name_dir | perl -pe 's#file://##'`
# if [ ! -d $namedir ]; then
#   echo "Namenode name directory not found: $namedir"
#   exit 2
# fi

if [ -z "$CLUSTER_NAME" ]; then
  echo "Cluster name not specified"
  exit 2
fi

# if [ "`ls -A $namedir`" == "" ]; then
#   echo "Formatting namenode name directory: $namedir"
#   $HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR namenode -format $CLUSTER_NAME
# fi

chown -R hdmaster:hadoop /var/data/hadoop
chown -R hdmaster:hadoop /var/log/hadoop/
chmod a+rw -R /var/log/hadoop/

if grep -q "False" /var/data/hadoop/hdfs/isActive
then 
	sudo -u hdmaster -g hadoop $HADOOP_HOME/bin/hdfs namenode -format $CLUSTER_NAME -force
	echo "True" > /var/data/hadoop/hdfs/isActive
fi

sudo -u hdmaster -g hadoop $HADOOP_HOME/bin/hdfs namenode

