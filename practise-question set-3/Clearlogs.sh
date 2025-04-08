#!/bin/bash

#List all .log files in /var/log
echo "Log files in /var/log:"
ls /var/log/*.log 2>/dev/null

#Archive them
ARCHIVE = "/var/log/logs_$(date+%Y%m%d_%H%M%S").tar.gz
tar -czf "$ARCHIVE" /var/log/*.log 2>/dev/null
echo "Archived logs:$ARCHIVE"

#Truncate (empty) original log files
sudo truncate -s 0 /var/log/*.log 2>/dev/null
echo "Log files cleared."

#Confirm Sucess
[ -f "$ARCHIVE" ] && echo "Backup successful!" || echo "Backup failed!"
