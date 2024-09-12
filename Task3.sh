#!/bin/bash

# Read the list of usernames from the file
touch user_list.txt
user_list_file="user_list.txt"
credentials_file="credentials.txt"

# Create the credentials file if it doesn't exist
touch "$credentials_file"

# Loop through each username in the list
while IFS= read -r username; do
  # Generate a random password
  password=$(openssl rand -base64 12)

  # Create the new user
  useradd "$username"

  # Save the username and password to the credentials file
  echo "$username:$password" >> "$credentials_file"
done < "$user_list_file"