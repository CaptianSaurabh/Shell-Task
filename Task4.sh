#!/bin/bash

# Prompt the user for the directory path
echo "Enter the directory path to backup:"
read -r directory_path

# Check if the directory exists
if [ ! -d "$directory_path" ]; then
  echo "Error: Directory does not exist"
  exit 1
fi

# Get the current date
current_date=$(date +"%Y-%m-%d")

# Create the backup file name
backup_file_name="backup_${current_date}.tar.gz"

# Compress the directory into a .tar.gz file
tar -czf "$backup_file_name" "$directory_path"

# Print a success message
echo "Backup created: $backup_file_name"