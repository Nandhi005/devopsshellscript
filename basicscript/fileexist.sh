#!/bin/bash

read -p "Enter the full path of the file name you want to check it exist or not:" filepath
while IFS= read server
do
	ssh -i /home/ec2-user/jenkins.pem ec2-user@"$server" << EOF
	if [ -f "$filepath" ]
	then
		echo "file exist on this $server"
	else
		echo "file does not exist"
	fi
EOF
done < server.txt
