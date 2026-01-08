#!/bin/bash
read -p "enter the service name:" servicename
state=$(systemctl is-active "$servicename")
present=$(systemctl list-unit-files --type=service | awk '{print $1}' | grep -i "$servicename")
if [[ $? -gt 0 ]]
then
	echo "$servicename not present"
	exit 1
fi
echo "$servicename is $state"
if [[ "$state" -eq "inactive" ]]
then
	sudo systemctl start "$servicename"
	echo "$servicename is active"
fi

