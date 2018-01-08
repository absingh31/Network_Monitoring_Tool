#!/bin/bash

#This code is written by Abhishek Singh(15BCE1009)

type=$1;
interface=$2
out_format=$3


data=($(grep $interface /proc/net/dev))
sleep 2
data2=($(grep $interface /proc/net/dev))

if [[ "$type" == *"up"* ]]
then
   id=9
else 
   id=1
fi

sa=${data2[$id]}

if [[ "$type" == *"total"* ]]
then
   sb=0
else
   sb=${data[$id]}
fi

delta=$(( sa - sb ))


if [ "$out_format" == "HUMAN" ]
then
   numfmt --to=iec-i --suffix=B $delta
elif [ "$out_format" == "GB" ]
then
    echo $delta | awk '{printf "%.2f", $1 / 1024 / 1024 / 1024}'
elif [ "$out_format" == "MB" ]
then
    echo $delta | awk '{printf "%.2f", $1 / 1024 / 1024}'
elif [ "$out_format" == "KB" ]
then
    echo $delta | awk '{printf "%.2f", $1 / 1024}'
else
    echo $delta
fi



