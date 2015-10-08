#!/bin/bash
# restore script 
# interactive script to restore from gsutil
# Author: Gian Luca Fiasco
version=${1}
fmatch="wordpress"
gsutil ls gs://ks-buck/mysql-${version} > /dev/null

if [ $? != 0 ]; then
	exit 5
fi 

declare -a files=($(gsutil ls gs://ks-buck/mysql-${version} | grep "$fmatch"))

for i in ${!files[@]}
do
	echo "press $i for ${files[$i]}"
done
read option

gsutil cp "${files[$option]}" .
fname=`basename "${files[$option]}"`
gunzip "$fname"
mysql -u root wordpress < `echo ${fname}|sed 's/\.gz//g'`
