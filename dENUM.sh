#!/bin/bash
subdomain=$1.0

nmap -p 53 -T4 $subdomain/24 -oA $subdomain
grep -B 4 open $subdomain.gnmap | grep -v "Nmap" | cut -d " " -f 2 | sort -u > $2.txt
for ip in $(cat $2.txt); do host -t ns $ip; done
