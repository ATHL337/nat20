#!/bin/bash

while read line; do
    # validate the IP address or hostname
    if [[ $line =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]] || [[ $line =~ ^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9].[a-zA-Z]{2,}$ ]]; then
        enum4linux -r $line | grep -v unknown
    else
        echo "Invalid IP address or hostname: $line"
    fi
done < $1
