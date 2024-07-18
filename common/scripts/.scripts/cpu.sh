#!/bin/bash

# cpu="$(top -bn1 | awk '/Cpu/ { print $2}')"
cpu="$(
	top -bn1 | grep "Cpu(s)" |
		sed "s/.*, *\([0-9.]*\)%* id.*/\1/" |
		awk '{print 100 - $1}'
)"
echo -e " $cpu%"
