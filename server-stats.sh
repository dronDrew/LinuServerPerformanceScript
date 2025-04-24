#!/bin/bash

echo 'Total CPU usage'
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'
echo 'Total memory usage in megabytes (Free vs Used including percentage)'
free -m | awk 'NR==2{print "Free: " $4 "Mbs Perc - " ($4 * 100)/$2 "% Used : " $3 "Mbs Perc - " ($3 * 100)/$2 "%"}'
echo 'Total disk usage (Free vs Used including percentage)'
df -h --total | grep 'total' |awk '{print "Free: " $4 " Proc - " 100 -$5 "% Used: " $3 " Proc - " $5}'
echo 'Top 5 processes by CPU usage'
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo "Top 5 processes by memory usage"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
