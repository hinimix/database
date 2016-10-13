#!/bin/bash

conn_string="mysql -uroot -p1 test -e"
a=`$conn_string "select device_id from tb_device" | grep [[:alnum:]]`
#INSERT INTO tb_batch (batch_no) VALUES("43001160826");
while read line; do
	select_result=`$conn_string "select device_id from tb_device where \
device_id='$line'"`
	if [ -z  $select_result ]; then
		mysql -uroot -p1 test -e "INSERT INTO tb_device (device_id,device_type,sp_id,batch_id) VALUES('$line',43,2,'38');"
	else
		echo "$line  exists"
	fi
done < judge_insert_source.data

