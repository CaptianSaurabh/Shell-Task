#!/bin/bash

# Create a directory named "backup" in the user's home directory
mkdir ~/backup

# Copy all .txt files from the current directory into the "backup" directory
for file in *.txt; do
  # Append the current date and time to the filename
  timestamp=$(date +"%Y-%m-%d-%H-%M-%S")
  new_filename="${file}_${timestamp}"
  cp "$file" "~/backup/${new_filename}"
done