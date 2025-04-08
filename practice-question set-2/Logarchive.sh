#!/bin/bash

#create /var/log/backups directory
sudo mkdir -p  /var/log/backups

#Compress all .log files into backup_YYYYMMDD.tar.gz
sudo tar -czf /var/log/backups/backup_$(date +"%Y%m%d").tar.gz /var/log/*.log

#list the creative archive
ls -l /var/log/backups/*.tar.gz
