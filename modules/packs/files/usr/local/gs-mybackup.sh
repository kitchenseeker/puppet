#!/bin/bash
# mysqldump backup on gsutil
# Author: Gian Luca Fiasco
# Email gfiasco88@gmail.com
getdate=`date +"%d.%m.%y"`
logintime=`date +"%d.%m.%y %T"`
local_folder=/root/mysql-stable
remote_folder='gs://ks-buck/mysql-stable'
/usr/bin/mysqldump -uroot wordpress | gzip > ${local_folder}/${getdate}-wordpress.$1.sql.gz 2>> /root/backupsql.log;
if [ $? -eq 0 ]; then
	echo "${logintime} wordpress backup completed successfully" >> /root/backupsql.log;
	echo `date +"%d.%m.%y %T"` "Dispatching backup to ${remote_folder}"
	/usr/local/bin/gsutil rsync -d -r  ${local_folder} ${remote_folder} >> /root/backupsql.log;
	echo `date +"%d.%m.%y %T"` "return code $?"  
else
        echo "${logintime} [ERROR] wordpress backup completed NOT successfully" >> /root/backupsql.log;
fi

