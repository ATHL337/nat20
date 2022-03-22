#!/bin/bash -x
subdomain=$1.0

for ip in $(seq 1 255); do 
dig @192.168.135 $1.$ip -t axfr | grep "com"
done
