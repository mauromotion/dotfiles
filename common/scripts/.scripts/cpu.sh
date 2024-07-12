#!/bin/bash

cpu="$(top -bn1 | awk '/Cpu/ { print $2}')"
echo -e " $cpu%"
