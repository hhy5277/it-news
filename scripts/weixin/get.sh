#!/bin/sh

for url in `cat ./urls.txt`; do
    t=`echo ${url} | awk -F',' '{print $1}'`
    u=`echo ${url} | awk -F',' '{print $2}'`

    echo $t
    echo '----------------'
    curl -s $u | hquery -p -f 'get.js'
done
