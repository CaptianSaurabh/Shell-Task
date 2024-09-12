#!/bin/bash

# Set the file name for the package list
touch packages.txt
package_file="packages.txt"

# Set the log file name
touch installation_log.txt
log_file="installation_log.txt"

# Function to install a package
install_package() {
  package_name=$1
  package_manager=$(which apt || which yum || which zypper || which brew)
  
  if [ -n "$package_manager" ]; then
    case $package_manager in
      *apt) sudo apt install -y "$package_name" ;;
      *yum) sudo yum install -y "$package_name" ;;
      *zypper) sudo zypper install -y "$package_name" ;;
      *brew) brew install "$package_name" ;;
      *) echo "Unsupported package manager" ;;
    esac
    if [ $? -eq 0 ]; then
      echo "[$(date)] $package_name installed successfully" >> "$log_file"
    else
      echo "[$(date)] Error installing $package_name" >> "$log_file"
    fi
  else
    echo "No package manager found"
  fi
}

# Read the package list from the file
while IFS= read -r package; do
  install_package "$package"
done < "$package_file"

echo "Installation complete. Check the log file for details."