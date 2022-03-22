#!/bin/bash

while read line; do enum4linux -r $line | grep -v unknown; done < $1
