#!/bin/bash

# DESCRIPTION -  On a new installation of Linux, backup a copy of the important configuration
#                files that you will customize.  Automatic copies to your Documents folder


# Define the backup directory
backup_dir="$HOME/Documents/ConfigBak"

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"

# List of important configuration files to back up
config_files=(
	"/etc/hosts"
	#"/etc/fstab"
	#"/etc/crontab"
	#"/etc/passwd"
	# Add more files here as needed
)

# Backup each configuration file
for file in "${config_files[@]}"; do
    # Extract the filename without path
    filename=$(basename "$file")
    # Create a backup with .bak extension
    sudo cp "$file" "$backup_dir/$filename.bak"
done

echo "Backup completed! Configuration files are stored in $backup_dir"

