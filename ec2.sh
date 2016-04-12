#!/bin/bash

ord() {
	LC_CTYPE=C printf '%d' "'$1"
}
cat /tmp/ec2-us-west-2 /tmp/ec2-eu-west-1 /tmp/ec2-sa-east-1 > /tmp/ec2.tmp
F=""
while read -n1 char 
do
	intChar=$(ord $char)
	if [ "$intChar" -eq 127 ]; then
		F="${F::-1}"
	else
		if [ "$intChar" -ne 96 ]; then 
			F=$F$char
		fi
	fi
	
	val="$(grep -E "$F" /tmp/ec2.tmp)"
	ip="$(echo $val | awk '{print $1 }')"
	if [ "$intChar" -eq 96 ]; then
		echo $ip | xclip -selection c
		exit
	fi
	
	tput clear
	printf "\n$val\n"
	printf "\n------------------------\n"
	printf "$ip\n"
	printf "search: $F\n"
done < "${1:-/dev/stdin}"





