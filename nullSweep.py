#!/bin/python3
import sys
import os

subnet = sys.argv[1]
start = int(sys.argv[2])
finish = int(sys.argv[3])
hoststart= str(subnet) + "." + str(start)
# response = os.system ("ping -c 1 -W 1 " + hoststart + " > /dev/null 2>&1")

for targ in range(start,finish+1):
#    print(targ)
    response = os.system("ping -c 1 -W 1 " + str(subnet) + "." + str(targ) + " > /dev/null 2>&1")
#    print(response)
    if response == 0:
        print(str(subnet)+"."+str(targ))

