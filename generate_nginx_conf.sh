#!/bin/bash
while read p; do
    sed "s/##DOMAIN##/$p/g" nginx.template > nginx_configs/$p.conf
done <domains.txt

for i in `seq 1 20`; do
    DOMAINFOLDER=$(sed -n $i"p" < domains.txt)
    mkdir $DOMAINFOLDER
    cp html.template $DOMAINFOLDER/index.html
done
for i in `seq 1 20`; do
    DOMAINFOLDER=$(sed -n $i"p" < domains.txt)
    TITLE=$(sed -n $i"p" < titles.txt)
    sed -i "s/##TITLE##/$TITLE/g" ./$DOMAINFOLDER/index.html
done
for i in `seq 1 20`; do
    DOMAINFOLDER=$(sed -n $i"p" < domains.txt)
    HASHTAG=$(sed -n $i"p" < hashtags.txt)
    sed -i "s/##HASHTAG##/$HASHTAG/g" ./$DOMAINFOLDER/index.html
done
for i in `seq 1 20`; do
    DOMAINFOLDER=$(sed -n $i"p" < domains.txt)
    QUOTE=$(sed -n $i"p" < quotes.txt)
    sed -i "s/##QUOTE##/$QUOTE/g" ./$DOMAINFOLDER/index.html
done
for i in `seq 1 20`; do
    DOMAINFOLDER=$(sed -n $i"p" < domains.txt)
    sed -i "s|##IMAGE##|https://s3-us-west-2.amazonaws.com/wfeather-images/$i.gif|g" ./$DOMAINFOLDER/index.html
done
