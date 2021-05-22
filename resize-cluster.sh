#!/bin/bash

# N is the node number of hadoop cluster
N=$1

if [ $# = 0 ]  
# $#: all parameter, this script has 1 para, cannot be no para.
then
	echo "Please specify the node number of hadoop cluster!"
	exit 1
fi

# change slaves file
i=1
rm config/slaves
while [ $i -lt $N ]
do
	echo "hadoop-slave$i" >> config/slaves
	((i++))
done 

echo ""

echo -e "\nbuild docker hadoop image\n"

# rebuild kiwenlau/hadoop image
sudo docker build -t demenlee/hadoop:v3.1 .

echo ""
