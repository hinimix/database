#!/bin/bash
#

while read lower_value
do
	mysql -uroot -p1 paipai -e "UPDATE tb_device SET device_id=upper('$lower_value') WHERE device_id=$lower_value;"
done < `mysql -uroot -p1 paipai -e "SELECT device_id FROM tb_device"`
