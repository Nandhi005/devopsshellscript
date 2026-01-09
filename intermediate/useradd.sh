#!/bin/bash
read -p "enter the username:" username
KEY="/home/ec2-user/jenkins.pem"
while IFS= read -r server
do
	ssh -i "$KEY" ec2-user@"$server" << EOF
	if id "$username" &> /dev/null
	then
		echo "$username already exists"
	else
		sudo useradd "$username"
                echo "$username:nandhish" | sudo chpasswd
                sudo passwd -e "$username"
                echo "you have to change the password for next login"
	fi
EOF
done < /devops-script/servers.txt
