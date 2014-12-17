#!/bin/sh

v=`cat ./version.txt`
dir="items"

for ((i=1;i<=$v;i++))
do
    if [ -d ${dir}/$i.csv ];
    then
        rm ${dir}/$i.csv
    fi
    echo "processing $i"
    curl -s "http://dartweekly.com/issues/$i" | hquery -p -f 'get.js' | gsed '1 i title,link' > ${dir}/$i.csv
done

