#!/bin/bash

echo ""

echo -e "\nbuild docker hadoop image\n"
sudo docker build -t demenlee/hadoop:3.0 .

echo ""
