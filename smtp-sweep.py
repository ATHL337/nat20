#!/usr/bin/python

import socket
import sys

# myfile = open("demo.txt", "r")
# myline = myfile.readline()

if len(sys.argv) != 3:
        print "Usage: smtp-sweep.py <ipaddress> <namefile>"
        sys.exit(0)

namefile = sys.argv[2]
myfile = open(namefile, "r")

print "Verifying users in " + namefile + " with " + sys.argv[1]
# Create a Socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.settimeout(2)
# Connect to the Server
connect = s.connect((sys.argv[1],25))
# Receive the banner
banner = s.recv(1024)
print banner

try:
	for myline in myfile:
		myline #= myfile.readline()
		# VRFY a user
		s.send('VRFY ' + myline)
		result = s.recv(1024)
		print "There is some response:  "
		print result
		 
	myfile.close()
	quit
#	print "python smtp-sweep.py <ip address> <username list> > output.txt 
#	print "don't forget to grep 252 output.txt | cut -d ' ' -f 1"
except:
	print "Unable to verify. Server maybe offline/port filtered/unopened"
finally:
	# Close the socket
	s.close()

# username examples	
# /usr/share/nmap/nselib/data/usernames.lst                  
# /usr/share/pipal/checkers_available/usernames.rb          
# /usr/share/postgresql/12/extension/insert_username--1.0.sql   
# /usr/share/postgresql/12/extension/insert_username--unpackaged--1.0.sql
# /usr/share/postgresql/12/extension/insert_username.control
# /usr/share/postgresql/14/extension/insert_username--1.0.sql
# /usr/share/postgresql/14/extension/insert_username.control
# /usr/share/seclists/Usernames/cirt-default-usernames.txt    
# /usr/share/seclists/Usernames/mssql-usernames-nansh0u-guardicore.txt
# /usr/share/seclists/Usernames/sap-default-usernames.txt
# /usr/share/seclists/Usernames/top-usernames-shortlist.txt  
# /usr/share/seclists/Usernames/xato-net-10-million-usernames-dup.txt  
# /usr/share/seclists/Usernames/xato-net-10-million-usernames.txt

