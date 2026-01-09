#!/bin/bash
read -p " enter the threshold for cpu usage:" THRESHOLD
server_file="/home/ec2-user/server.txt"
key="/home/ec2-user/jenkins.pem"
for i in $(cat $server_file)
do
	ssh -i "$key" ec2-user@"$i" "THRESHOLD=$THRESHOLD bash -s" << 'EOF'
	echo "read the first cpu input from /proc/stat"
	total=$(sudo cat /proc/stat | awk '/^cpu / {print $2+$3+$4+$5+$6+$7+$8+$9}')
	idle=$(sudo cat /proc/stat | awk '/^cpu / {print $5+$6}')
		sleep 6
	echo "read the second cpu input from /proc/stat"
	total2=$(sudo cat /proc/stat | awk '/^cpu / {print $2+$3+$4+$5+$6+$7+$8+$9}')
	idle2=$(sudo cat /proc/stat | awk '/^cpu / {print $5+$6}')
		total_diff="$((total2 - total))"
		idle_diff="$((idle2 - idle))"
		used_diff="$((total_diff - idle_diff))"
		echo "used_diff : $used_diff"
		echo "total_diff: $total_diff"
		echo "idle_diff: $idle_diff"
	cpu_usage="$((used_diff * 100 / total_diff))"
		echo "cpu_usage: ${cpu_usage}%"
		echo "$THRESHOLD"
	if [[ "$cpu_usage" -gt "$THRESHOLD" ]]
	then
		echo "cpu exceeded the threshold"
	else
		echo "cpu is not exceeded"
	fi

EOF
done
