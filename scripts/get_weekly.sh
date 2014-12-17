#!/bin/sh

if [ `uname` != 'Linux' ];
then
    s='gsed'
else
    s='sed'
fi

for i in `jq '.[].url' weekly.json | sed 's/"//g'`
# for i in "http://bitcoinweekly.com/"
do
    name=`echo $i | sed 's/http:\/\///g' | awk -F '.' '{print $1}'`
    id=`curl -s $i | hquery -p -r '$(".sample a").attr("href").split("/")[2]'`
    file="../weekly/${name}/${id}.csv"
    echo "checking $name..."
    if [ ! -e $file ];
    then
        # not exists, then get it
        url="$i/issues/${id}"
        # echo 'not exists'
        # echo $i
        # echo $id
        # echo $name
        # echo $file
        echo "get $name issue $id ..."
        curl -s $url | hquery -p -f 'get_weekly.js' | ${s} '1 i title,link' > ../weekly/${name}/${id}.csv
    fi
done

cd ..
git fetch
git pull origin master
git add .
git commit -m 'auto update'
git push origin master
