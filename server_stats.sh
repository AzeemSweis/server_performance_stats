#!/bin/bash

# Script to display server statistics

echo "Server Statistics"
echo "-----------------"
echo "CPU Utilization: $(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')%"
echo "Memory Utilization (Free vs Used): $(free -m | awk 'NR==2{printf "Used: %sMB (%.2f%%) Free: %sMB (%.2f%%)", $3,$3*100/$2,$4,$4*100/$2}')"
echo "Disk Utilization (Free vs Used): $(df -h | awk '$NF=="/"{printf "Used: %dGB (%s) Free: %dGB (%s)", $3,$5,$4,$6}')"
echo "Top 5 CPU processes: $(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6)"
echo "Top 5 Memory processes: $(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6)"
echo "-----------------"

echo "Additional Information"
echo "-----------------"
echo "OS Version: $(cat /etc/*release | head -n 1)"
echo "Up Time: $(uptime)"
echo "Load Average: $(uptime | awk -F'load average:' '{print $2}')"
echo "Total logged in users: $(who | wc -l)"
echo "Failed Login Attempts: $(grep 'Failed password' /var/log/auth.log | wc -l)"
echo "-----------------"