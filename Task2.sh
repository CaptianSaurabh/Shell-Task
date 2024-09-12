#!/bin/bash

# Get CPU and memory usage
cpu_usage=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}' | sed 's/%//')
memory_usage=$(free -g | awk '/^Mem/ {print $7}')

# Check if CPU usage is above 80% or available memory is below 20%
if [ $cpu_usage  -gt 80 ]; then
  echo "CPU usage is high Plese kill Some Task: $cpu_usage%" >> system_health.log
  echo "System health alert: CPU usage is above 80%!"
elif [ $memory_usage -lt 20 ]; then
  echo "Available memory is low: $memory_usage GB" >> system_health.log
  echo "System health alert: Available memory is below 20%!"
fi

# Log the results
echo "CPU usage: $cpu_usage%" >> system_health.log
echo "Available memory: $memory_usage GB" >> system_health.log