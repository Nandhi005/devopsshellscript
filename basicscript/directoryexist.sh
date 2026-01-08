#!/bin/bash

read -p "Enter the full path of the directory you want to check it exist or not:" directory
while IFS= read server
do
        ssh -i /home/ec2-user/jenkins.pem ec2-user@"$server" << EOF
        if [ ! -d "$directory" ]
        then
                mkdir -p "$directory"
		echo "$directory is created"
        else
                echo "directory is already present on this $server"
        fi
EOF
done < server.txt
