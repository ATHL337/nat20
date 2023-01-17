#!/bin/bash

# validate input
if [[ $# -ne 2 ]] || ! [[ $1 =~ ^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9].[a-zA-Z]{2,}$ ]] || ! [[ $2 =~ ^[0-9]{1,5}$ ]]; then
    echo "Usage: $0 <subdomain> <port_number>"
    exit 1
fi

subdomain=$1
port=$2

# perform the zone transfer
for ip in $(seq 1 255); do 
    dig @$subdomain $subdomain.$ip -p $port +short -t axfr -f output.txt
done
