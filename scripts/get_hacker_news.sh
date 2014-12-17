#!/bin/sh

# echo $1
# echo $2
line="$1,$2"
date=`date +%Y%m%d`
dir='../hacker_news'
file="${dir}/${date}.csv"
# echo $date
# echo $file

if [ -e $file ];then
    # exists
    echo $line >> $file
else
    # not exists
    echo 'title,link' > $file
    echo $line >> $file
fi
