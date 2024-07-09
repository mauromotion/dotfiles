#!/bin/bash

used_space=$(df --output=pcent /media/Linux_Data | tail -n 1 | tr -d ' %')
echo -e "󱛟 2: ${used_space}%"
