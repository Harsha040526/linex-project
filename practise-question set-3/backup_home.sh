#!/bin/bash

#Create timestamped directory
DIR = "/backups/home_$(date + "%Y%m%d_%H%M%S")"
mkdir -p "$DIR"

#copy /home to new directory
cp -r /home "$DIR"

#compress the backup
tar -czf "$DIR.tar.gz" "$DIR"

#verify the backup integrity
tar -tzf "$DIR.tar.gz" >/dev/null && echo "Backup successful: $DIR.tar.gz" || echo "Backup failed!"

#Remove the uncompressed directory
rm -r "$DIR"
