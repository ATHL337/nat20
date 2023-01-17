#!/bin/bash

# validate input
if [[ $# -ne 2 ]] || ! [[ $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]] || ! [[ $2 =~ ^[a-zA-Z0-9][a-zA-Z0-9-]{1,}$ ]]; then
    echo "Usage: $0 <subnet> <output_file>"
    exit 1
fi

subnet=$1
output_file=$2

# perform the scan
nmap -sL -n -oN $output_file.txt $subnet/24

# get the open ports
grep -v "Status: Up" $output_file.txt | cut -d " " -f 2 | sort -u > $output_file-open.txt

# get the DNS servers
for ip in $(cat $output_file-open.txt); do host --dns-servers $ip; done
