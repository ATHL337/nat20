#!/bin/bash
for ip in $(seq $2 $3); do ping -c 1 -W 1 $1.$ip; done | grep "64 bytes" | grep -v "100% packet loss" | cut -d " " -f 4 | tr -d ":"
#do cutycapt --url=$ip --out$ip.png; done
