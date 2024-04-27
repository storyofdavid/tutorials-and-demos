#! /bin/bash

# Get the current date
BackupTime=`date +%b-%d-%y` 

# Set the backup destination and source locations
Destination=/media/dolding/Expansion/Backups
Sources=(
    "/home/dolding/Homarr"
    "/home/dolding/Sonarr"
    "/home/dolding/Radarr"
)

# Remove old backups
# Clean up the destination folder by removing all files and subdirectories
# Be careful with this command: it will delete everything in the folder
rm -rf $Destination/*

# Create a backup file using current date.
tar -cpzf "$Destination/$BackupTime.tar.gz" "${Sources[@]}"