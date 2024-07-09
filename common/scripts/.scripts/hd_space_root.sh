#!/bin/bash

used_space=$(df --output=pcent / | tail -n 1 | tr -d ' %')
echo -e "󱛟 1: ${used_space}%"
