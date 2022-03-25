#!/bin/bash
for ip in $(seq 1 255); do python smtp-sweep.py 10.11.1.$ip /usr/share/seclists/Usernames/top-usernames-shortlist.txt;done 2>/dev/null > smtp-sweet-output.txt

