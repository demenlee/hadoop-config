#!/bin/bash

# the default node number is 4: 1 master, 3 slaves
N=${1:-4}


# start hadoop master container
sudo docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
		-p 9000:9000 \
                --name hadoop-master \
                --hostname hadoop-master \
                demenlee/hadoop:v3 &> /dev/null


# start hadoop slave container
i=1
while [ $i -lt $N ]
# -lt: if $i < $N ,return ture ; N=4
do
	sudo docker rm -f hadoop-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	sudo docker run -itd \
	                --net=hadoop \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
	                demenlee/hadoop:v3 &> /dev/null
	i=$(( $i + 1 ))
done 

# get into hadoop master container
# sudo docker exec -it hadoop-master bash
